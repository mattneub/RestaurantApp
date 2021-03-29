//
// Created by Daniel Coleman on 2/26/21.
//

import UIKit

public protocol MenuItemCell : UITableViewCell {

    var viewModel: MenuItemViewModel { get }
}

public class MenuItemCellImp : UITableViewCell, MenuItemCell {

    public let viewModel: MenuItemViewModel

    public init(viewModel: MenuItemViewModel) {

        self.viewModel = viewModel

        super.init(style: .default, reuseIdentifier: nil)

        self.textLabel?.text = viewModel.title
    }

    required init?(coder: NSCoder) {

        fatalError("Screw you interface builder!!")
    }
}
