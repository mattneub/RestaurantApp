//
// Created by Daniel Coleman on 1/22/21.
//

import XCTest

class RestaurantMenuAcceptanceTests: BDDTest {

    func testMenuActivityLogoImage() {

        let rma = given.restaurantMenuActivity()
        let liv = given.logoImageView(rma)
        let li = given.logoImage()

        when.activityAppears(rma)

        then.imageShouldBe(liv, li)
    }

    // Notice that the layout acceptance tests test the "what", which is where things actually end up on the screen: in other words, frames.  But they don't test "how".  Whether we
    // use Autolayout, set the frames ourselves, toss in some other layout engine, or whatever, these tests don't care.  They only test whether what we do gives us the results we want.
    // The unit tests, on the other hand, are testing the use of Autolayout.  The role of the unit tests is to drive, and test, design.  The two combine to prove both that we "build the
    // right thing" (acceptance test), and "build the thing right" (unit test).  A typical CI/CD setup is to run unit tests first, which tend to be faster, and then run acceptance tests
    // only if unit tests all pass.

    // Another thing going on here is that we're expressing the fact that the layout "should" work for a range of screen sizes.  We're doing what we might call "Monte Carlo" style
    // tests (https://en.wikipedia.org/wiki/Monte_Carlo_method), where we throw a few (or maybe a lot, depending on your goals) random values within the "valid" range at the
    // production code and make sure it handles them correctly.
    func testMenuActivityLogoLayout() {

        let screens = (0..<10).map { i -> UIScreenMock in given.screen() }

        for screen in screens {

            let rma = given.restaurantMenuActivity()
            let liv = given.logoImageView(rma)
            let li = given.logoImage()

            when.activityIsLaidOutIn(rma, screen)

            then.topsShouldEqual(liv, screen)
            then.leftsShouldEqual(liv, screen)
            then.rightsShouldEqual(liv, screen)
            then.aspectRatiosShouldEqual(liv, li)
        }
    }

    func testMenuActivityMainListLayout() {

        let screens = (0..<10).map { i -> UIScreenMock in given.screen() }

        for screen in screens {

            let rma = given.restaurantMenuActivity()
            let rml = given.restaurantMenuListInMenuActivity(rma)
            let liv = given.logoImageView(rma)

            when.activityIsLaidOutIn(rma, screen)

            then.topShouldEqualBottom(rml, liv)
            then.leftsShouldEqual(rml, screen)
            then.rightsShouldEqual(rml, screen)
            then.bottomsShouldEqual(rml, screen)
        }
    }
}
