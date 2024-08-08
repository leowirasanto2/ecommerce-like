//
//  SearchResultView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 08/08/24.
//

import SwiftUI

struct SearchResultView: View {
    @State var products: [Product] = []
    var screenSize: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: screenSize.width / 2.3, maximum: screenSize.width / 2)),
                GridItem(.flexible(minimum: screenSize.width / 2.3, maximum: screenSize.width / 2))
            ] , spacing: 16) {
                ForEach(products, id: \.id) { item in
                    Button {
                        
                    } label: {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: item.imageUrl)) { img in
                                img
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: .infinity, height: screenSize.width / 2)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } placeholder: {
                                Color.clear
                            }
                            
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
                        .frame(width: screenSize.width / 2.3, height: screenSize.width / 1.4, alignment: .leading)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
        .scrollClipDisabled()
    }
}

#Preview {
    GeometryReader(content: { geometry in
        SearchResultView(products: Product.dummyData, screenSize: geometry.size)
    })
}
