//
// Created by Daniel Coleman on 2/26/21.
//

import XCTest

class RestaurantMenuListViewModelTests: BDDTest {

    func testRetrieveMenuItems() {

        let store = given.restaurantMenuStore()
        let menuItems = given.restaurantMenuItems()
        given.restaurantMenuStore(store, returnsItems: menuItems)

        let vm = when.restaurantMenuListViewModelIsCreated(store)

        then.viewModelMenuList(vm, menuItemsShouldBe: menuItems)
    }

    func testCellCount() {

        let menuItems = given.restaurantMenuItems()
        let vm = given.restaurantMenuListViewModel()

        when.restaurantMenuListViewModel(vm, itemsAreSetTo: menuItems)

        then.restaurantMenuListViewModel(vm, numberOfCellsShouldBe: menuItems.count)
    }

    func testCellsBuilderRequest() {

        let menuItems = given.restaurantMenuItems()
        let cellBuilder = given.cellBuilderMock()

        // We want this to work for every valid index, which is a finite iterable set, so we might as well test all of them.  You have to be careful with this kind of test
        // in Swift, where we have to roll our own mocks.  Don't forget to reset them!  If you're testing that a method got called once, you need to reset the recorded calls
        // between every test.  This is an area where first-class support for multiple "cases" of a single test by the test framework (XCTest in our case) would be nice.
        for index in given.indicesIn(menuItems) {

            let menuItem = given.itemAtIndex(menuItems, index)
            let vm = given.restaurantMenuListViewModel(cellBuilder: cellBuilder)
            given.restaurantMenuListViewModel(vm, itemsAre: menuItems)

            let _ = when.restaurantMenuListViewModel(vm, getCellForIndex: index)

            then.cellBuilder(cellBuilder, cellsForItemsShouldBeCalledOnceWithItem: menuItem)

            cellBuilder.reset()
        }
    }

    func testCellsBuilderResponse() {

        let menuItems = given.restaurantMenuItems()

        for index in given.indicesIn(menuItems) {

            let cellBuilder = given.cellBuilderMock()
            let expectedCell = given.menuItemCell()
            given.cellBuilder(cellBuilder, returnsCell: expectedCell)
            let vm = given.restaurantMenuListViewModel(cellBuilder: cellBuilder)
            given.restaurantMenuListViewModel(vm, itemsAre: menuItems)

            let cell = when.restaurantMenuListViewModel(vm, getCellForIndex: index)

            then.cell(cell, isEqualToCell: expectedCell)

            cellBuilder.reset()
        }
    }
}