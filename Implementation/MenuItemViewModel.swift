//
// Created by Daniel Coleman on 2/26/21.
//

import Foundation

public protocol MenuItemViewModel : class {

    var title: String { get }
}

public class MenuItemViewModelImp : MenuItemViewModel
{
    public let title: String

    init(item: RestaurantMenuItem) {

        title = item.name
    }
}
