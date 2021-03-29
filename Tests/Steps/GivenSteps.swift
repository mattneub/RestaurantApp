//
// Created by Daniel Coleman on 1/22/21.
//

import UIKit
import RestaurantAppLib

class GivenSteps {

    func restaurantMenuActivity() -> RestaurantMenuController {

        RestaurantMenuController()
    }

    func menuItemViewModelTitle(_ model: MenuItemViewModelMock) -> String {

        let titleLength = Int.random(in: 12..<24)
        model.title = String.randomString(length: titleLength)
        return model.title
    }

    func menuItemViewModel() -> MenuItemViewModelMock {

        MenuItemViewModelMock()
    }

    func cellBuilder(_ viewModelFactory: MenuItemViewModelFactory) -> MenuItemCellBuilderImp {

        MenuItemCellBuilderImp(viewModelFactory: viewModelFactory)
    }

    func cellViewModelFactory() -> MenuItemViewModelFactoryMock {

        MenuItemViewModelFactoryMock()
    }

    func cellViewModel() -> MenuItemViewModelMock {

        MenuItemViewModelMock()
    }

    func menuItemHasName(_ item: RestaurantMenuItem) -> String {

        item.name
    }

    func cellViewModelFactory(_ factory: MenuItemViewModelFactoryMock, returnsViewModel viewModel: MenuItemViewModelMock) {

        factory.viewModelForItemImp = { _ in viewModel }
    }

    func menuItem() -> RestaurantMenuItem {

        let nameLength = Int.random(in: 4..<64)
        return RestaurantMenuItem(name: String.randomString(length: nameLength))
    }

    func restaurantMenuListViewModelMock() -> RestaurantMenuListViewModelMock {

        RestaurantMenuListViewModelMock()
    }

    func restaurantMenuListViewModel(cellBuilder: MenuItemCellBuilder = MenuItemCellBuilderMock()) -> RestaurantMenuListViewModelImp {

        RestaurantMenuListViewModelImp(store: RestaurantMenuStoreMock(), cellBuilder: cellBuilder)
    }

    func restaurantMenuStoreBundled() -> RestaurantMenuStoreBundled {

        RestaurantMenuStoreBundled()
    }

    func restaurantMenuStore() -> RestaurantMenuStoreMock {

        RestaurantMenuStoreMock()
    }

    func restaurantMenuList(_ cellBuilder: MenuItemCellBuilder) -> RestaurantMenuListImp {

        let viewModel = RestaurantMenuListViewModelImp(cellBuilder: cellBuilder)
        return RestaurantMenuListImp(viewModel: viewModel)
    }

    func menuItemCells(forMenuItems menuItems: [RestaurantMenuItem]) -> (cellBuilder: MenuItemCellBuilderMock, cells: [MenuItemCell]) {

        // This is setting up a cell builder to return a specific cell for a specific menu item, so we can check later to see if those exact cells are being used by the tableview.
        // If a RestaurantMenuItem we don't recognize (it doesn't belong to the menuItems passed in) is passed in, we'll just return a random new cell.  We have to return this
        // cell builder in addition to this list of fake cells, because we'll have to pass the cell builder to the tableview.
        let cellBuilder = MenuItemCellBuilderMock()

        let menuItemCells: [MenuItemCell] = menuItems.map { _ -> MenuItemCell in MenuItemCellMock() }

        cellBuilder.cellForItemImp = { (item: RestaurantMenuItem) -> MenuItemCell in

            guard let index = menuItems.firstIndex(of: item) else { return MenuItemCellMock() }
            return menuItemCells[index]
        }

        return (cellBuilder: cellBuilder, cells: menuItemCells)
    }

    func index() -> Int {

        Int.random(in: 0..<1024)
    }

    func cellBuilder(_ builder: MenuItemCellBuilderMock, returnsCell cell: MenuItemCell) {

        builder.cellForItemImp = { _ in cell }
    }

    func menuItemCell() -> MenuItemCell {

        MenuItemCellMock()
    }

    func itemAtIndex<T>(_ items: [T], _ index: Int) -> T {

        items[index]
    }

    func indicesIn<T>(_ items: [T]) -> [Int] {

        Array(0..<items.count)
    }

    func restaurantMenuListViewModel(_ vm: RestaurantMenuListViewModelImp, itemsAre items: [RestaurantMenuItem]) {

        vm.items = items
    }

    func menuItemCells() -> [MenuItemCell] {

        let count = Int.random(in: 4..<12)

        return (0..<count).map { i in

            MenuItemCellMock()
        }
    }

    func cellBuilderMock() -> MenuItemCellBuilderMock {

        MenuItemCellBuilderMock()
    }

    func restaurantMenuStore(_ store: RestaurantMenuStoreMock, returnsItems items: [RestaurantMenuItem]) {

        store.fetchItemsImp = {

            items
        }
    }

    func restaurantMenuItems() -> [RestaurantMenuItem] {

        let count = Int.random(in: 4..<12)

        return (0..<count).map { i in

            let nameLength = Int.random(in: 4..<64)
            return RestaurantMenuItem(name: String.randomString(length: nameLength))
        }
    }

    func restaurantMenuViewModel() -> RestaurantMenuViewModel {

        RestaurantMenuViewModelImp()
    }

    func restaurantMenuViewModelMock() -> RestaurantMenuViewModelMock {

        RestaurantMenuViewModelMock()
    }

    func restaurantMenuViewModelLogoImage(_ vm: RestaurantMenuViewModel) -> UIImage {

        vm.logoImage
    }

    func screen() -> UIScreenMock {

        let width = CGFloat(UInt.random(in: 128..<2048))
        let aspectRatio = CGFloat.random(in: 1.0..<4.0)
        let height = floor(width * aspectRatio)
        let size = CGSize(width: width, height: height)
        let screen = UIScreenMock()
        screen.size = size
        return screen
    }

    func aspectRatio(_ li: UIImage) -> CGFloat {

        li.size.width / li.size.height
    }

    func constrainTops(_ view1: UIView, _ view2: UIView) -> NSLayoutConstraint {

        view1.topAnchor.constraint(equalTo: view2.topAnchor)
    }

    func constrainAspectRatio(_ view: UIView, _ aspectRatio: CGFloat) -> NSLayoutConstraint {

        view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: aspectRatio)
    }

    func restaurantMenuListInMenuActivity(_ rma: RestaurantMenuController) -> RestaurantMenuList {

        rma.view.subviews.first { view in view.accessibilityIdentifier == RestaurantMenuController.menuListId }! as! RestaurantMenuList
    }

    func listOfCurrentMenuItems() -> [RestaurantMenuItem] {

        let url = Bundle.currentBundle.url(forResource: "MenuItems", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode([RestaurantMenuItem].self, from: data)
    }

    func constrainTopToBottom(_ view1: UIView, _ view2: UIView) -> NSLayoutConstraint {

        view1.topAnchor.constraint(equalTo: view2.bottomAnchor)
    }

    func constrainBottoms(_ view1: UIView, _ view2: UIView) -> NSLayoutConstraint {

        view1.bottomAnchor.constraint(equalTo: view2.bottomAnchor)
    }

    func constrainLefts(_ view1: UIView, _ view2: UIView) -> NSLayoutConstraint {

        view1.leftAnchor.constraint(equalTo: view2.leftAnchor)
    }

    func constrainRights(_ view1: UIView, _ view2: UIView) -> NSLayoutConstraint {

        view1.rightAnchor.constraint(equalTo: view2.rightAnchor)
    }

    func restaurantViewModelLogoImage(_ vm: RestaurantMenuViewModelMock) -> UIImage {

        let image = UIImage.generateRandomImage()

        vm.logoImage = image

        return image
    }

    func restaurantMenuViewController(_ vm: RestaurantMenuViewModel = RestaurantMenuViewModelMock()) -> RestaurantMenuController {

        RestaurantMenuController(menuList: RestaurantMenuListMock(), viewModel: vm)
    }

    func copyOfImage(_ image: UIImage) -> UIImage {

        image.copy() as! UIImage
    }

    func testImage() -> UIImage {

        UIImage(named: "TestImage1", in: Bundle(for: GivenSteps.self), with: nil)!
    }

    func differentTestImage() -> UIImage {

        UIImage(named: "TestImage2", in: Bundle(for: GivenSteps.self), with: nil)!
    }

    func logoImageView(_ rma: RestaurantMenuController) -> UIImageView {

        rma.view.subviews.first { view in view.accessibilityIdentifier == RestaurantMenuController.logoImageId }! as! UIImageView
    }

    func logoImage() -> UIImage {

        UIImage(named: "Logo", in: Bundle(for: RestaurantMenuController.self), with: nil)!
    }

    func mobileApp() -> AppDelegate {

        AppDelegate()
    }
}
