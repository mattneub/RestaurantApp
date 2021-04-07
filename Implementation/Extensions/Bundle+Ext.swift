//
// Created by Daniel Coleman on 2/6/21.
//

import Foundation

extension Bundle {

    static public var currentBundle: Bundle {

        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {

            return Bundle(for: NSClassFromString("RestaurantAppTests.BDDTest")!.self)

        }

        return Bundle.main
    }
}
