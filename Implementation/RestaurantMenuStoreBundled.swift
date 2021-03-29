//
// Created by Daniel Coleman on 2/26/21.
//

import Foundation

public class RestaurantMenuStoreBundled : RestaurantMenuStore {

    public init() {

    }

    public func fetchItems() -> [RestaurantMenuItem] {

        let url = Bundle.currentBundle.url(forResource: "MenuItems", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode([RestaurantMenuItem].self, from: data)
    }
}
