//
// Created by Daniel Coleman on 1/23/21.
//

import RestaurantAppLib
import UIKit

class RestaurantMenuViewModelMock : RestaurantMenuViewModel {

    public var logoImage: UIImage = UIImage(named: "TestImage1", in: Bundle(for: RestaurantMenuViewModelMock.self), with: nil)!
}
