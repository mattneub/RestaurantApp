//
// Created by Daniel Coleman on 2/26/21.
//

import XCTest

class MenuItemViewModelTests: BDDTest {

    func testTitle() {

        let menuItem = given.menuItem()
        let name = given.menuItemHasName(menuItem)

        let viewModel = when.createMenuItemViewModel(forItem: menuItem)

        then.menuItemViewModel(viewModel, titleIs: name)
    }
}