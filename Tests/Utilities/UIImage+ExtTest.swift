//
// Created by Daniel Coleman on 1/23/21.
//

import UIKit

extension UIImage {

    static func generateRandomImage() -> UIImage {

        let width = Int.random(in: 32..<64)
        let height = Int.random(in: 32..<64)

        let count = width * height * 4
        var data = Data()
        for _ in 0..<count {
            data.append(UInt8.random(in: 0..<255))
        }

        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)
        let bitsPerComponent = 8
        let bitsPerPixel = 32

        guard let providerRef = CGDataProvider(data: data as CFData) else {
            fatalError("Huh?")
        }

        guard let cgim = CGImage(
                width: width,
                height: height,
                bitsPerComponent: bitsPerComponent,
                bitsPerPixel: bitsPerPixel,
                bytesPerRow: width * 4,
                space: rgbColorSpace,
                bitmapInfo: bitmapInfo,
                provider: providerRef,
                decode: nil,
                shouldInterpolate: true,
                intent: .defaultIntent
        ) else {
            fatalError("Uh Oh")
        }

        return UIImage(cgImage: cgim)
    }
}
