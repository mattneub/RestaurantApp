//
//  RestaurantAppAcceptanceTests.swift
//  RestaurantAppAcceptanceTests
//
//  Created by Daniel Coleman on 1/22/21.
//

import XCTest

class StartupTests: BDDTest {

    func testAppInitialActivity() {

        let rma = given.restaurantMenuActivity()
        let app = given.mobileApp()

        when.appFinishesLaunching(app)

        then.currentActivityShouldBe(app, rma)
    }
}
