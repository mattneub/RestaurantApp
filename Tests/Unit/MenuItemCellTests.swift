//
// Created by Daniel Coleman on 2/26/21.
//

import XCTest

class MenuItemCellTests: BDDTest {

    func testLabel() {

        let viewModel = given.menuItemViewModel()
        let title = given.menuItemViewModelTitle(viewModel)

        let cell = when.createMenuItemCell(viewModel)

        then.menuItemCell(cell, labelTextIs: title)
    }
}