//
//  UIImage+Ext.swift
//  LargeImageLoading
//
//  Created by 马陈爽 on 2020/12/11.
//

import Foundation
import UIKit

extension UIImage {
    func resizeImageTo(target: CGFloat) -> UIImage? {
        let width = self.size.width
        let height = self.size.height
        let scale = self.size.width / self.size.height
        var newSize = CGSize.zero
        if width <= target && height <= target {
            return self
        } else {
            if self.size.width > self.size.height {
                newSize.width = target
                newSize.height = target / scale
            } else {
                newSize.height = target
                newSize.width = target * height
            }
            
            if newSize.width.truncatingRemainder(dividingBy: 2) != 0 {
                newSize.width = CGFloat(Int(newSize.width) + 1)
            }
            if newSize.height.truncatingRemainder(dividingBy: 2) != 0 {
                newSize.height = CGFloat(Int(newSize.height) + 1)
            }
            
            newSize.width = min(target, newSize.width)
            newSize.height = min(target, newSize.height)
        }
        let w = Int(newSize.width)
        let h = Int(newSize.height)
        let colorSpaceRef = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGImageByteOrderInfo.orderDefault.rawValue
        guard let newContext = CGContext(data: nil, width: w, height: h, bitsPerComponent: 8, bytesPerRow: w * bytesPerPixel, space: colorSpaceRef, bitmapInfo: bitmapInfo) else { return self }
        let renderFrame = CGRect(x: 0, y: 0, width: w, height: h)
        newContext.draw(self.cgImage!, in: renderFrame)
        if let newCGImage = newContext.makeImage() {
            return UIImage(cgImage: newCGImage)
        }
        return self
    }
}
