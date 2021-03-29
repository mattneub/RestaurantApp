//
// Created by Daniel Coleman on 2/6/21.
//

import UIKit

public protocol RestaurantMenuListViewModel : UITableViewDataSource {

    var items: [RestaurantMenuItem] { get set }
}

public class RestaurantMenuListViewModelImp: NSObject, RestaurantMenuListViewModel {

    public var items: [RestaurantMenuItem]

    public let cellBuilder: MenuItemCellBuilder

    public convenience override init() {

        self.init(store: RestaurantMenuStoreBundled(), cellBuilder: MenuItemCellBuilderImp())
    }

    public init(store: RestaurantMenuStore = RestaurantMenuStoreBundled(), cellBuilder: MenuItemCellBuilder) {

        items = store.fetchItems()
        self.cellBuilder = cellBuilder
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = items[indexPath.row]
        return cellBuilder.cell(forItem: item)
    }
}
