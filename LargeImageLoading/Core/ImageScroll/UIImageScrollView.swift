//
//  UIImageScrollView.swift
//  LargeImageLoading
//
//  Created by 马陈爽 on 2020/12/11.
//

import Foundation
import UIKit

class UIImageScrollView: UIView {
    let image = UIImage(contentsOfFile: Bundle.main.path(forResource: "中国地图", ofType: "jpg")!)!
    
    private var foreTiledView: TiledImageView!
    private var imageScale: CGFloat = 1
    private var minScale: CGFloat = 1
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.addSubview(self.scrollView)
        
        var imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        self.imageScale = self.frame.size.width / imageRect.size.width
        imageRect.size = CGSize(width: imageRect.width * self.imageScale, height: imageRect.height * self.imageScale)
        self.foreTiledView = TiledImageView(frame: imageRect, image: self.image, scale: self.imageScale)
        self.scrollView.addSubview(self.foreTiledView)
        self.scrollView.frame = imageRect
        self.minScale = self.imageScale
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.scrollView.frame = self.bounds
//        var imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
//        self.imageScale = self.frame.size.width / imageRect.size.width
//        imageRect.size = CGSize(width: imageRect.width * self.imageScale, height: imageRect.height * self.imageScale)
//        self.foreTiledView.frame = imageRect
//        self.foreTiledView.imageScale = self.imageScale
//        self.scrollView.frame = imageRect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.maximumZoomScale = 20.0
        view.minimumZoomScale = 1.0
        return view
    }()
}


extension UIImageScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        self.foreTiledView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        self.foreTiledView.removeFromSuperview()
        self.imageScale = self.imageScale * scale
        if self.imageScale < self.minScale {
            self.imageScale = self.minScale
        }
        var imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        //self.imageScale = self.frame.size.width / imageRect.size.width
        imageRect.size = CGSize(width: imageRect.width * self.imageScale, height: imageRect.height * self.imageScale)
        debugPrint(#function + ":\(imageRect)")
        self.foreTiledView = TiledImageView(frame: imageRect, image: self.image, scale: self.imageScale)
        self.scrollView.addSubview(self.foreTiledView)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
}
