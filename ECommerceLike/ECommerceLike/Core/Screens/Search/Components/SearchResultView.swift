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
    var didTap: (Product) -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            ProductGridContainer(screenSize: screenSize, products: products, didTap: didTap)
        }
        .scrollClipDisabled()
    }
}

#Preview {
    GeometryReader(content: { geometry in
        SearchResultView(products: Product.dummyData, screenSize: geometry.size) { product in }
    })
}
