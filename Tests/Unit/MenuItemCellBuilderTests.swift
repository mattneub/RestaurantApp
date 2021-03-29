//
// Created by Daniel Coleman on 2/26/21.
//

import XCTest

class MenuItemCellBuilderTestsTests: BDDTest {

    func testViewModelRequest() {

        let menuItem = given.menuItem()
        let cellViewModelFactory = given.cellViewModelFactory()
        let cellBuilder = given.cellBuilder(cellViewModelFactory)

        let _ = when.buildCell(cellBuilder, forItem: menuItem)

        then.cellViewModelFactory(cellViewModelFactory, viewModelShouldBeCalledWith: menuItem)
    }

    func testViewModelResponse() {

        let menuItem = given.menuItem()
        let cellViewModel = given.cellViewModel()
        let cellViewModelFactory = given.cellViewModelFactory()
        given.cellViewModelFactory(cellViewModelFactory, returnsViewModel: cellViewModel)
        let cellBuilder = given.cellBuilder(cellViewModelFactory)

        let cell = when.buildCell(cellBuilder, forItem: menuItem)

        then.cell(cell, viewModelIs: cellViewModel)
    }
}