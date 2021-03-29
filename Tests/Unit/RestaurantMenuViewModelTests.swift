//
// Created by Daniel Coleman on 1/23/21.
//

import XCTest

class RestaurantMenuViewModelTests: BDDTest {

    func testLogo() {

        let vm = given.restaurantMenuViewModel()
        let expectedLogoImage = given.logoImage()
        let li = given.restaurantMenuViewModelLogoImage(vm)

        then.imagesShouldBeTheSame(li, expectedLogoImage)
    }
}