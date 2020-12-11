//
//  ImageScrollView.swift
//  LargeImageLoading
//
//  Created by 马陈爽 on 2020/12/11.
//

import SwiftUI

struct ImageScrollView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIImageScrollView {
        let v = UIImageScrollView()
        v.setContentHuggingPriority(.required, for: .horizontal) // << here !!
        v.setContentHuggingPriority(.required, for: .vertical)
        return v
    }
    
    func updateUIView(_ uiView: UIImageScrollView, context: Context) {
        
    }
}

struct ImageScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ImageScrollView()
    }
}
