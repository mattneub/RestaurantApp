//
// Created by Daniel Coleman on 2/6/21.
//

import UIKit

public protocol RestaurantMenuList : UIView {

    var viewModel: RestaurantMenuListViewModel { get }
}

public class RestaurantMenuListImp: UITableView, RestaurantMenuList {

    public var viewModel: RestaurantMenuListViewModel

    required init?(coder: NSCoder) {

        fatalError("Screw you interface builder!!")
    }

    public convenience init() {

        self.init(viewModel: RestaurantMenuListViewModelImp())
    }

    public init(viewModel: RestaurantMenuListViewModel) {

        self.viewModel = viewModel

        super.init(frame: .zero, style: .plain)

        dataSource = self.viewModel
    }
}