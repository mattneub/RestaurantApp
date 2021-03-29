//
// Created by Daniel Coleman on 2/26/21.
//

import RestaurantAppLib

class MenuItemViewModelFactoryMock : MenuItemViewModelFactory {

    public var viewModelForItemImp: (_ item: RestaurantMenuItem) -> MenuItemViewModel = { _ in MenuItemViewModelMock() }

    struct ViewModelForItemCall { let item: RestaurantMenuItem }
    public private(set) var viewModelForItemCalls: [ViewModelForItemCall] = []

    func viewModel(forItem item: RestaurantMenuItem) -> MenuItemViewModel {

        viewModelForItemCalls.append(ViewModelForItemCall(item: item))
        return viewModelForItemImp(item)
    }
}
