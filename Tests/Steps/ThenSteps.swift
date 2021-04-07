//
// Created by Daniel Coleman on 1/22/21.
//

import UIKit
import RestaurantAppLib

import XCTest

class ThenSteps {

    func currentActivityShouldBe(_ app: AppDelegate, _ activity: UIViewController) {

        guard let window = app.window else {
            XCTFail("No window")
            return
        }
        
        guard window.isKeyWindow else {
            XCTFail("Window is not key")
            return
        }

        guard let currentActivity = window.rootViewController else {
            XCTFail("No current activity is present")
            return
        }

        XCTAssertTrue(type(of: currentActivity) == type(of: activity), "Current activity is not correct type")
    }

    func menuItemViewModel(_ model: MenuItemViewModelImp, titleIs expectedTitle: String) {

        XCTAssertEqual(model.title, expectedTitle, "Title is not correct")
    }

    func cellViewModelFactory(_ factory: MenuItemViewModelFactoryMock, viewModelShouldBeCalledWith item: RestaurantMenuItem) {

        let calls = factory.viewModelForItemCalls

        XCTAssertEqual(calls.count, 1, "Factory not called correct number of times")
        XCTAssertEqual(calls[0].item, item, "Factory not called with correct item")
    }

    func cell(_ cell: MenuItemCell, viewModelIs expectedViewModel: MenuItemViewModel) {

        XCTAssertTrue(cell.viewModel === expectedViewModel, "ViewModel is not correct")
    }

    func menuItemCell(_ mic: MenuItemCell, labelTextIs expectedText: String) {

        XCTAssertEqual(mic.textLabel?.text, expectedText, "Cell label is not correct")
    }

    func restaurantMenuList(_ rml: RestaurantMenuListImp, dataSourceShouldBe expectedDataSource: RestaurantMenuListViewModel) {

        XCTAssertTrue(rml.dataSource === expectedDataSource)
    }

    func restaurantMenuListViewModel(_ vm: RestaurantMenuListViewModelImp, numberOfCellsShouldBe expectedCount: Int) {

        XCTAssertEqual(vm.tableView(UITableView(), numberOfRowsInSection: 0), expectedCount, "Cell count is not correct")
    }

    func restaurantMenuList(_ rml: RestaurantMenuListImp, shouldDisplaysCells expectedCells: [MenuItemCell]) {

        // If you know table views, it should immediately jump out at you, that this doesn't take into account a classic mistake when using table view:
        // forgetting to call "reloadData".  The displayed cells in a table view are only synced with what the dataSource provides when a call to reloadData
        // occurs.  We're "lucky" in this sample app, because the dataSource is loaded up with data before the tableview is created and wired up.  The automatic
        // "reloadData" that occurs at the very beginning is sufficient.  But if we had dynamic data, this would no longer be good enough.  A reliable test would
        // have to take calls to "reloadData" into account.  One way to do this is to create a subclass of UITableView for use in tests only, and make sure it gets
        // injected during the test.  This subclass will override "reloadData" to do exactly what we're doing here: call the dataSource to grab the number of rows/sections
        // and retrieve all the associated cells.  The subclass can then store this as a property called, say, "currentlyDisplayedCells".  The test will simply query
        // this property.  This way, since "currentlyDisplayedCells" only gets updated when "reloadData" is called, this will more closely mimic the real behavior of a
        // table view.  Note that this is necessary because a more "direct" test by examining the view hierarchy has its own problems, due to the cell reuse behavior of table views.
        // We aren't, however, testing that reuse behavior.  We trust Apple and assume the reuse logic places views in the hierarchy "correctly".  What does "correctly" mean?
        // Well (unless you're using animated batch updates), it means the cells equal what the dataSource says, when "reloadData" is called.  It is that definition of "correct"
        // that we're trying to capture when we replace parts of UIKit with test doubles, or attempt to mimic parts of its behavior in our tests.
        let dataSource: UITableViewDataSource = rml.dataSource!
        let itemCount = dataSource.tableView(rml, numberOfRowsInSection: 0)
        let cells = (0..<itemCount).map { row in

            dataSource.tableView(rml, cellForRowAt: IndexPath(row: row, section: 0))
        }

        XCTAssertTrue(cells.elementsEqual(expectedCells) { first, second in first === second }, "Cells are not equal")
    }

    func cellBuilder(_ builder: MenuItemCellBuilderMock, cellsForItemsShouldBeCalledOnceWithItem item: RestaurantMenuItem) {

        let calls = builder.cellForItemCalls

        XCTAssertEqual(calls.count, 1, "Builder not called correct number of times")
        XCTAssertEqual(calls[0].item, item, "Builder not called with correct item")
    }

    func cell(_ cell: UITableViewCell, isEqualToCell expectedCell: UITableViewCell) {

        XCTAssertTrue(cell === expectedCell, "Cells are not equal")
    }

    func menuItems(_ items: [RestaurantMenuItem], shouldEqual expectedItems: [RestaurantMenuItem]) {

        XCTAssertEqual(items, expectedItems, "Menu items are not equal")
    }

    func viewModelMenuList(_ viewModel: RestaurantMenuListViewModelImp, menuItemsShouldBe expectedItems: [RestaurantMenuItem]) {

        XCTAssertEqual(viewModel.items, expectedItems, "Menu items are not equal")
    }

    func topsShouldEqual(_ first: UIView, _ second: Bounded) {

        let firstTop = first.convert(first.bounds.origin, to: second.coordinateSpace).y
        let secondTop = second.bounds.minY
        XCTAssertTrue(comparePoints(first: firstTop, second: secondTop), "tops are not equal")
    }

    func leftsShouldEqual(_ first: UIView, _ second: Bounded) {

        let firstLeft = first.convert(first.bounds.origin, to: second.coordinateSpace).x
        let secondLeft = second.bounds.minX
        XCTAssertTrue(comparePoints(first: firstLeft, second: secondLeft), "lefts are not equal")
    }

    func rightsShouldEqual(_ first: UIView, _ second: Bounded) {

        let firstRight = first.convert(first.bounds.origin, to: second.coordinateSpace).x + first.frame.size.width
        let secondRight = second.bounds.maxX
        XCTAssertTrue(comparePoints(first: firstRight, second: secondRight), "rights are not equal")
    }

    func topShouldEqualBottom(_ first: UIView, _ second: Bounded) {

        let firstTop = first.convert(first.bounds.origin, to: second.coordinateSpace).y
        let secondBottom = second.bounds.maxY

        if(!comparePoints(first: firstTop, second: secondBottom)) {
            print("test")
        }

        XCTAssertTrue(comparePoints(first: firstTop, second: secondBottom), "top does not equal bottom")
    }

    func menuList(_ rml: RestaurantMenuList, displayedItemsShouldBe menuItems: [RestaurantMenuItem]) {

        XCTAssertEqual(rml.viewModel.items, menuItems, "Menu items are not equal")
    }

    func bottomsShouldEqual(_ first: UIView, _ second: Bounded) {

        XCTAssertEqual(first.convert(first.bounds.origin, to: second.coordinateSpace).y + first.frame.size.height, second.bounds.maxY, "bottoms are not equal")
    }

    func comparePoints(first: CGFloat, second: CGFloat) -> Bool {

        // Layout properties, like frames/bounds, are floats.  However, internally UIKit lays things out in terms of integer pixels.  Empirical testing has determined that
        // the way UIKit rounds to the nearerst pixel is to always round up.  If, after taking scaling into account, a CGFloat value corresponds to, say, 8.1 pixels, UIKit
        // will always round this up to 9 pixels.  However, this can cause problems, especially when the screen scale is 3, due to the limited precision of floats.  Dividing
        // then multiplying by 3 can result in a slightly larger value, which will round up by a whole pixel.  Instead, we will test up to a tolerance.  After all, we don't
        // actually care how UIKit does its rounding.  If Apple decided to change how they round, our layout tests would break "incorrectly" (they should still pass, but don't),
        // which makes them brittle tests.  Really, the requirement is that we get our layouts to within 1 pixel of an expected value (or, perhaps, some other tolerance.
        // This is an interesting conversation to have with the designer, who may have never thought about it.  Does he only really care about layouts to within 2 pixels?
        // Or 5 pixels?  Ultimately, the designer is the authority on this).
        let pixelFirst = first * UIScreen.main.scale
        let pixelSecond = second * UIScreen.main.scale

        return abs(pixelSecond - pixelFirst) < 1.0
    }

    func aspectRatiosShouldEqual(_ view: UIView, _ image: UIImage) {

        let imageAspectRatio = image.size.height / image.size.width
        XCTAssertTrue(comparePoints(first: view.frame.size.height, second: view.frame.size.width * imageAspectRatio), "Aspect ratios are not equal")
    }

    func viewShouldContainConstraints(_ view: UIView, _ constraints: [NSLayoutConstraint]) {

        // There are two helper methods here for testing the presence of contraints.  The first one just recursively searches a view's subviews and adds up all of the
        // constraints it finds attached at any point in the hierarchy.  Where a contraint is attached doesn't affect what it does (unless it's attached at an invalid point).
        // The second one is a helper method for comparing two constraints.  If you try to use "==" or "isEqual", you'll find that the "isActive" property is taken into
        // consideration.  The constraints we're creating in the tests aren't actually added to any hierarchy, nor should they be (making them active adds them to the very
        // place we're testing to see if they were added).  They're just there to contain the attributes we're testing for.  They will therefore be inactive, while the
        // contraints we're testing must be active.  The helper method simply compares the attributes we care about, and ignores isActive.  Do we need to test for "isActive"
        // as well?  No, because "isActive" simply tells us whether it's been added to the hierarchy.  Since we're looking in the hierarchy, anything we find is "active" by
        // definition.
        for constraint in constraints {

            XCTAssertTrue(view.allConstraints.contains { existingConstraint in (existingConstraint as NSLayoutConstraint).isSameAs(constraint) })
        }
    }

    func imagesShouldNotBeTheSame(_ image1: UIImage, _ image2: UIImage) {

        XCTAssertFalse(image1.isSameImageAs(image2), "Images are the same")
    }

    func imagesShouldBeTheSame(_ image1: UIImage, _ image2: UIImage) {

        XCTAssertTrue(image1.isSameImageAs(image2), "Images are not the same")
    }

    func imageShouldBe(_ liv: UIImageView, _ li: UIImage) {

        XCTAssertTrue(liv.image?.isSameImageAs(li) ?? false, "Images are not the same")
    }
}
