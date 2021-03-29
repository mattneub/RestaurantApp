//
// Created by Daniel Coleman on 1/22/21.
//

import UIKit

public class RestaurantMenuController: UIViewController {

    public static let logoImageId = "logoImage"
    public static let menuListId = "menuList"

    private let viewModel: RestaurantMenuViewModel

    public let logoImageView = UIImageView()
    public let menuList: RestaurantMenuList

    public convenience init() {

        self.init(
                menuList: RestaurantMenuListImp(),
                viewModel: RestaurantMenuViewModelImp())
    }

    public init(
            menuList: RestaurantMenuList, viewModel:
            RestaurantMenuViewModel) {

        self.menuList = menuList

        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    // Whenever you define an initializer for a view or view controller, you are required to override this one, which is called when a view/controller is used in a XIB or storyboard.
    // Since we're not using Interface Builder, this is just a recurring annoyance, and we express our frustration appropriately.
    public required init?(coder: NSCoder) {

        fatalError("Screw you Interface Builder!!")
    }

    public override func viewDidLoad() {

        super.viewDidLoad()

        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {

        logoImageView.accessibilityIdentifier = RestaurantMenuController.logoImageId
        logoImageView.image = viewModel.logoImage
        view.addSubview(logoImageView)

        menuList.accessibilityIdentifier = RestaurantMenuController.menuListId
        view.addSubview(menuList)
    }

    private func setupConstraints() {

        let logoImage = viewModel.logoImage
        let logoImageAspectRatio = logoImage.size.width / logoImage.size.height

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: logoImageAspectRatio).isActive = true

        menuList.translatesAutoresizingMaskIntoConstraints = false
        menuList.topAnchor.constraint(equalTo: logoImageView.bottomAnchor).isActive = true
        menuList.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuList.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
