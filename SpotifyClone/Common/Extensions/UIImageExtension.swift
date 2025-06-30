//
//  UIImageExtension.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import UIKit

extension UIImage {
    static func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()
        var duration: TimeInterval = 0

        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))

                let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [CFString: Any]
                let gifProperties = properties?[kCGImagePropertyGIFDictionary] as? [CFString: Any]
                let delay = gifProperties?[kCGImagePropertyGIFDelayTime] as? Double ?? 0.1
                duration += delay
            }
        }

        return UIImage.animatedImage(with: images, duration: duration)
    }
}
