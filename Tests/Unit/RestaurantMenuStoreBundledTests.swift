//
// Created by Daniel Coleman on 2/26/21.
//

import XCTest

class RestaurantMenuStoreBundledTests: BDDTest {

    func testLogo() {

        let store = given.restaurantMenuStoreBundled()
        let bundledMenuItems = given.listOfCurrentMenuItems()

        let menuItems = when.fetchItems(fromStore: store)

        then.menuItems(menuItems, shouldEqual: bundledMenuItems)
    }
}