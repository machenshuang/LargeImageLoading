//
//  TiledImageView.swift
//  LargeImageLoading
//
//  Created by 马陈爽 on 2020/12/11.
//

import UIKit

class TiledImageView: UIView {
    
    private let image: UIImage
    var imageScale: CGFloat
    private let imageRect: CGRect
    
    override class var layerClass: AnyClass {
        CATiledLayer.self
    }
    
    init(frame: CGRect, image: UIImage, scale: CGFloat) {
        self.image = image
        self.imageScale = scale
        self.imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        super.init(frame: frame)
        let layer = self.layer as! CATiledLayer
        layer.levelsOfDetail = 4
        layer.levelsOfDetailBias = 4
        layer.tileSize = CGSize(width: 512, height: 512)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        context.scaleBy(x: self.imageScale, y: self.imageScale)
        context.draw(self.image.cgImage!, in: self.imageRect)
        context.restoreGState()
    }
}
