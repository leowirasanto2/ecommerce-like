//
//  FullscreenImagePreview.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import SwiftUI

struct FullscreenImagePreview: View {
    var imageUrls: [String] = []
    
    var body: some View {
        GeometryReader { geo in
            TabView {
                ForEach(imageUrls, id: \.self) { url in
                    AsyncImage(url: URL(string: url)) { img in
                        img.image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: .infinity)
                    }
                    .frame(maxWidth: geo.size.width)
                    .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .background(.black)
    }
}

#Preview {
    FullscreenImagePreview(imageUrls: Product.dummyData.first!.carouselImageUrls)
}
