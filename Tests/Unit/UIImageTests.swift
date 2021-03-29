//
// Created by Daniel Coleman on 1/23/21.
//

import XCTest

class UIImageTests: BDDTest {

    func testIdenticalImages() {

        let image1 = given.testImage()
        let image2 = given.copyOfImage(image1)

        then.imagesShouldBeTheSame(image1, image2)
    }

    func testDifferentImages() {

        let image1 = given.testImage()
        let image2 = given.differentTestImage()

        then.imagesShouldNotBeTheSame(image1, image2)
    }
}
