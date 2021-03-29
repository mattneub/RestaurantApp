//
// Created by Daniel Coleman on 2/26/21.
//

import Foundation

public protocol MenuItemViewModelFactory {

    func viewModel(forItem: RestaurantMenuItem) -> MenuItemViewModel
}

public class MenuItemViewModelFactoryImp : MenuItemViewModelFactory {

    public init() {


    }

    public func viewModel(forItem item: RestaurantMenuItem) -> MenuItemViewModel {

        MenuItemViewModelImp(item: item)
    }
}
