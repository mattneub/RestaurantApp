//
//  RestaurantAppUnitTests.swift
//  RestaurantAppUnitTests
//
//  Created by Daniel Coleman on 1/22/21.
//

import XCTest

class RestaurantMenuControllerTests: BDDTest {

    func testLogoImage() {

        let vm = given.restaurantMenuViewModelMock()
        let vc = given.restaurantMenuViewController(vm)
        let li = given.restaurantViewModelLogoImage(vm)
        let liv = given.logoImageView(vc)

        when.activityAppears(vc)

        then.imageShouldBe(liv, li)
    }

    func testLogoLayout() {

        let vm = given.restaurantMenuViewModelMock()
        let vc = given.restaurantMenuViewController(vm)
        let li = given.restaurantViewModelLogoImage(vm)
        let aspectRatio = given.aspectRatio(li)
        let liv = given.logoImageView(vc)
        let topConstraint = given.constrainTops(liv, vc.view)
        let leftConstraint = given.constrainLefts(liv, vc.view)
        let rightConstraint = given.constrainRights(liv, vc.view)
        let aspectRatioConstraint = given.constrainAspectRatio(liv, aspectRatio)

        when.activityAppears(vc)

        then.viewShouldContainConstraints(vc.view, [topConstraint, leftConstraint, rightConstraint, aspectRatioConstraint])
    }

    func testMenuListLayout() {

        let vc = given.restaurantMenuViewController()
        let rml = given.restaurantMenuListInMenuActivity(vc)
        let liv = given.logoImageView(vc)
        let topConstraint = given.constrainTopToBottom(rml, liv)
        let leftConstraint = given.constrainLefts(rml, vc.view)
        let rightConstraint = given.constrainRights(rml, vc.view)
        let bottomConstraint = given.constrainBottoms(rml, vc.view)

        when.activityAppears(vc)

        then.viewShouldContainConstraints(vc.view, [topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }
}
