//
// Created by Daniel Coleman on 1/23/21.
//

import UIKit

extension NSLayoutConstraint {

    func isSameAs(_ other: NSLayoutConstraint) -> Bool {

        firstItem === other.firstItem &&
                firstAttribute == other.firstAttribute &&
                relation == other.relation &&
                secondItem === other.secondItem &&
                secondAttribute == other.secondAttribute
    }
}