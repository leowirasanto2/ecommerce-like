//
//  ProductDescView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import SwiftUI

struct ProductDescView: View {
    var descriptionContents: [ProductDescriptionItem] = []
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(descriptionContents, id: \.id) { item in
                descItemView(item)
            }
        }
    }
    
    private func descItemView(_ item: ProductDescriptionItem) -> some View {
        return VStack(alignment: .leading, spacing: 8) {
            if let title = item.title {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.regular)
            }
            
            Text(item.content)
                .font(.subheadline)
                .fontWeight(.light)
        }
        .multilineTextAlignment(.leading)
    }
}

#Preview {
    ProductDescView(
        descriptionContents: ProductDescriptionItem.dummyDesc1
    )
}
