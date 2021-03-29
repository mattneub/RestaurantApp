//
// Created by Daniel Coleman on 1/23/21.
//

import UIKit

extension UIView {

    var allConstraints: [NSLayoutConstraint] {

        var result = self.constraints

        for subview in subviews {

            result.append(contentsOf: subview.allConstraints)
        }

        return result
    }
}
