//
//  ProductGridContainer.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 08/08/24.
//

import SwiftUI

struct ProductGridContainer: View {
    var screenSize: CGSize
    var columns: [GridItem] = []
    var products: [Product] = []
    var didTap: (Product) -> ()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns.isEmpty ? getDefaultGridItem() : columns , spacing: 16) {
                    ForEach(products, id: \.id) { item in
                        Button {
                            didTap(item)
                        } label: {
                            VStack(alignment: .leading) {
                                Rectangle()
                                    .fill(.clear)
                                    .frame(width: .infinity, height: screenSize.width * 0.5)
                                    .overlay {
                                        AsyncImage(url: URL(string: item.imageUrl)) { img in
                                            img.image?
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: .infinity, height: .infinity)
                                        }
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 10))

                                VStack(alignment: .leading, spacing: 8) {
                                    Text(item.name)
                                        .fontWeight(.medium)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                    
                                    Text(item.formattedPrice())
                                        .font(.footnote)
                                        .lineLimit(1)
                                }
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.leading)
                                .frame(width: .infinity, alignment: .leading)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
        }
    }
    
    func getDefaultGridItem() -> [GridItem] {
        return [
            GridItem(.flexible(minimum: screenSize.width / 2.3, maximum: screenSize.width / 2)),
            GridItem(.flexible(minimum: screenSize.width / 2.3, maximum: screenSize.width / 2))
        ]
    }
}

#Preview {
    GeometryReader { geo in
        ProductGridContainer(screenSize: geo.size, products: Product.dummyData) { product in }
    }
}
