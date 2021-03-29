//
// Created by Daniel Coleman on 1/23/21.
//

import UIKit

public protocol RestaurantMenuViewModel {

    var logoImage: UIImage { get }
}

public class RestaurantMenuViewModelImp: RestaurantMenuViewModel {

    public let logoImage: UIImage = UIImage(named: "Logo", in: Bundle(for: RestaurantMenuViewModelImp.self), with: nil)!

    public init() {


    }
}
