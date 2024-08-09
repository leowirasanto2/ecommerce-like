//
//  DashboardBrandCarousel.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct DashboardBrandCarousel: View {
    var brands: [Brand] = []
    var screenSize: CGSize = .zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Shop by brand category")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.dynamic(light: .black, dark: .white))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("View all")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(brands, id: \.id) { item in
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.2))
                                .frame(width: screenSize.width / 4, height: screenSize.width / 5)
                                .overlay {
                                    AsyncImage(url: URL(string: item.imageUrl ?? "")) { image in
                                        image.image?.resizable()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                                .shadow(color: .gray.opacity(0.1), radius: 8)
                        }
                    }
                }
            }.scrollClipDisabled()
        }
    }
}

#Preview {
    DashboardBrandCarousel(brands: Brand.dummyBrands, screenSize: .init(width: 300, height: 800))
}
