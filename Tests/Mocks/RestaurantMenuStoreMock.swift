//
// Created by Daniel Coleman on 2/26/21.
//

import RestaurantAppLib

class RestaurantMenuStoreMock : RestaurantMenuStore {

    public var fetchItemsImp: () -> [RestaurantMenuItem] = { [] }

    func fetchItems() -> [RestaurantMenuItem] {

        fetchItemsImp()
    }
}
