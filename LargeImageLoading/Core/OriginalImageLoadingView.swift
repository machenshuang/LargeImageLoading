//
//  OriginalImageLoadingView.swift
//  LargeImageLoading
//
//  Created by 马陈爽 on 2020/12/11.
//

import SwiftUI

struct OriginalImageLoadingView: View {
    
    var body: some View {
        let image = UIImage(contentsOfFile: Bundle.main.path(forResource: "中国地图", ofType: "jpg")!)!
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
    }
}

struct OriginalImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OriginalImageLoadingView()
        }
    }
}
