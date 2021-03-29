//
// Created by Daniel Coleman on 2/6/21.
//

import Foundation

public struct RestaurantMenuItem : Equatable, Codable {

    public let name: String

    public init(name: String) {

        self.name = name
    }

    public static func ==(lhs: RestaurantMenuItem, rhs: RestaurantMenuItem) -> Bool {

        lhs.name == rhs.name
    }
}