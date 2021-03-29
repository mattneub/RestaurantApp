//
// Created by Daniel Coleman on 2/26/21.
//

import XCTest

class RestaurantMenuListAcceptanceTests: BDDTest {

    func testMenuListInitialItems() {

        let lmi = given.listOfCurrentMenuItems()

        let rml = when.restaurantMenuListIsCreated()

        then.menuList(rml, displayedItemsShouldBe: lmi)
    }

    func testDisplayMenuItems() {

        let lmi = given.restaurantMenuItems()
        let (cellBuilder, mic) = given.menuItemCells(forMenuItems: lmi)
        let rml = given.restaurantMenuList(cellBuilder)

        when.restaurantMenuList(rml, displayedItemsAreSetTo: lmi)

        then.restaurantMenuList(rml, shouldDisplaysCells: mic)
    }
}
