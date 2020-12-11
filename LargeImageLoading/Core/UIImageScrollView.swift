//
//  UIImageScrollView.swift
//  LargeImageLoading
//
//  Created by 马陈爽 on 2020/12/11.
//

import Foundation
import UIKit

class UIImageScrollView: UIView {
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Hello，I am Swift"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.label.frame = frame
        self.addSubview(self.label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
