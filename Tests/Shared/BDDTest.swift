//
// Created by Daniel Coleman on 1/23/21.
//

import XCTest

public func stepNotImplemented() -> Never {
    fatalError("Step Not Implemented")
}

class BDDTest: XCTestCase {

    var given: GivenSteps!
    var when: WhenSteps!
    var then: ThenSteps!

    override func setUpWithError() throws {

        given = GivenSteps()
        when = WhenSteps()
        then = ThenSteps()
    }

    override func tearDownWithError() throws {

        given = nil
        when = nil
        then = nil
    }
}