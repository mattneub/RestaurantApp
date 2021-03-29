//
// Created by Daniel Coleman on 1/23/21.
//

import UIKit

class UIScreenMock : UIScreen {

    var size = CGSize.zero

    override var bounds: CGRect {

        CGRect(origin: .zero, size: size)
    }
}
