//
// Created by Daniel Coleman on 2/26/21.
//

import Foundation

extension String {

    static func randomString(length: Int) -> String {

        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}