//
//  ImageResizeLoading.swift
//  LargeImageLoading
//
//  Created by 马陈爽 on 2020/12/11.
//

import SwiftUI

struct ImageResizeLoadingView: View {
    var body: some View {
        let image = UIImage(contentsOfFile: Bundle.main.path(forResource: "中国地图", ofType: "jpg")!)!.resizeImage2To(target: 1280)!
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
    }
}

struct ImageResizeLoading_Previews: PreviewProvider {
    static var previews: some View {
        ImageResizeLoadingView()
    }
}
