//
// Created by Daniel Coleman on 2/26/21.
//

import Foundation

public protocol RestaurantMenuStore {

    func fetchItems() -> [RestaurantMenuItem]
}
