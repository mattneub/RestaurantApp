//
// Created by Daniel Coleman on 1/23/21.
//

import UIKit

extension UIImage {

    public func isSameImageAs(_ otherImage: UIImage) -> Bool {

        guard let data = pngData(),
              let otherData = otherImage.pngData() else {
            return false
        }

        return data == otherData
    }
}