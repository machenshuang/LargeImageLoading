//
//  ContentView.swift
//  LargeImageLoading
//
//  Created by 马陈爽 on 2020/12/11.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                NavigationLink(
                    destination: OriginalImageLoadingView(),
                    label: {
                        Text("加载原图")
                    })
                NavigationLink(
                    destination: ImageResizeLoadingView(),
                    label: {
                        Text("尺寸调节加载（1280x）")
                    })
                NavigationLink(
                    destination: ImageScrollView(),
                    label: {
                        Text("Scroll View 加载")
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
