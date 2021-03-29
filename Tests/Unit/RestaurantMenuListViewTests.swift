//
// Created by Daniel Coleman on 2/26/21.
//

import XCTest

class RestaurantMenuListTests: BDDTest {

    func testDataSource() {

        let viewModel = given.restaurantMenuListViewModelMock()

        let rml = when.restaurantMenuListIsCreatedWithViewModel(viewModel)

        then.restaurantMenuList(rml, dataSourceShouldBe: viewModel)
    }
}