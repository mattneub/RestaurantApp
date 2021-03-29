//
// Created by Daniel Coleman on 2/26/21.
//

import XCTest

class MenuItemCellAcceptanceTests: BDDTest {

    func testLabel() {

        let mi = given.menuItem()
        let n = given.menuItemHasName(mi)

        let mic = when.createMenuItemCellForItem(mi)

        then.menuItemCell(mic, labelTextIs: n)
    }
}
