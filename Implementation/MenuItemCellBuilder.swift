//
// Created by Daniel Coleman on 2/26/21.
//

import UIKit

public protocol MenuItemCellBuilder {

    func cell(forItem: RestaurantMenuItem) -> MenuItemCell
}

public class MenuItemCellBuilderImp : MenuItemCellBuilder {

    private let viewModelFactory: MenuItemViewModelFactory

    public convenience init() {

        self.init(viewModelFactory: MenuItemViewModelFactoryImp())
    }

    public init(viewModelFactory: MenuItemViewModelFactory) {

        self.viewModelFactory = viewModelFactory
    }

    public func cell(forItem item: RestaurantMenuItem) -> MenuItemCell {

        let viewModel = viewModelFactory.viewModel(forItem: item)
        return MenuItemCellImp(viewModel: viewModel)
    }
}