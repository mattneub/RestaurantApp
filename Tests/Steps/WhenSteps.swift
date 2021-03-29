//
// Created by Daniel Coleman on 1/22/21.
//

import UIKit
import RestaurantAppLib

class WhenSteps {

    func appFinishesLaunching(_ app: AppDelegate) {

        _ = app.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
    }

    func createMenuItemViewModel(forItem item: RestaurantMenuItem) -> MenuItemViewModelImp {

        MenuItemViewModelFactoryImp().viewModel(forItem: item) as! MenuItemViewModelImp
    }

    func createMenuItemCell(_ viewModel: MenuItemViewModel) -> MenuItemCellImp {

        MenuItemCellImp(viewModel: viewModel)
    }

    func compareImages(_ image1: UIImage, _ image2: UIImage) -> Bool {

        image1.isSameImageAs(image2)
    }

    func buildCell(_ builder: MenuItemCellBuilderImp, forItem item: RestaurantMenuItem) -> MenuItemCell {

        builder.cell(forItem: item)
    }

    func createMenuItemCellForItem(_ item: RestaurantMenuItem) -> MenuItemCell {

        let viewModel = RestaurantMenuListViewModelImp()
        return viewModel.cellBuilder.cell(forItem: item)
    }

    func fetchItems(fromStore store: RestaurantMenuStore) -> [RestaurantMenuItem] {

        store.fetchItems()
    }

    func restaurantMenuListViewModelIsCreated(_ store: RestaurantMenuStore) -> RestaurantMenuListViewModelImp {

        RestaurantMenuListViewModelImp(store: store, cellBuilder: MenuItemCellBuilderMock())
    }

    func restaurantMenuListViewModel(_ vm: RestaurantMenuListViewModelImp, itemsAreSetTo items: [RestaurantMenuItem]) {

        vm.items = items
    }

    func restaurantMenuList(_ rml: RestaurantMenuListImp, displayedItemsAreSetTo items: [RestaurantMenuItem]) {

        rml.viewModel.items = items
    }

    // This is an example of us mimicking what the framework does.  If you think about it, this is a sensible way to test code that works with a framework.
    // How do we test code that uses a library, if we're not testing the library itself?  The answer, of course, is to replace the "real" library with some
    // kind of test double, such as a mock.  Application code calls a library, so we test it by recording the calls made to the library, and defining what
    // the library returns.  With frameworks, the roles are reversed: frameworks call application code, not vice versa.  The way we test such application code
    // is not to *capture* the entry into a library from our code, but to *trigger* the entry into our code from a framework.  We just need to know how
    // the framework triggers our code in order to do this.  We already have to know this, because it's how we decide what application code to write.
    // All we need to do is call our application code the same way we expect it to be called by the framework.
    func activityAppears(_ activity: UIViewController) {

        activity.loadViewIfNeeded()
        activity.viewWillAppear(false)
        activity.viewDidAppear(false)
    }

    func activityIsLaidOutIn(_ activity: UIViewController, _ screen: UIScreen) {

        activity.view.frame = screen.bounds
        activity.view.layoutIfNeeded()
    }

    func restaurantMenuListViewModel(_ vm: RestaurantMenuListViewModelImp, getCellForIndex index: Int) -> UITableViewCell {

        vm.tableView(UITableView(), cellForRowAt: IndexPath(row: index, section: 0))
    }

    func restaurantMenuListIsCreated() -> RestaurantMenuList {

        RestaurantMenuController().menuList
    }

    func restaurantMenuListIsCreatedWithViewModel(_ viewModel: RestaurantMenuListViewModel) -> RestaurantMenuListImp {

        RestaurantMenuListImp(viewModel: viewModel)
    }
}
