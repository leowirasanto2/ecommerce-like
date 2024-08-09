//
//  ProductReviewView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import SwiftUI

struct ProductReviewView: View {
    var reviews: [ProductReview] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(reviews, id: \.id) { item in
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.curatorName)
                        .font(.subheadline)
                        .fontWeight(.regular)
                    Text(item.comment)
                        .font(.subheadline)
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                Divider()
            }
        }
    }
}

#Preview {
    ProductReviewView(
        reviews: ProductReview.dummyReviews
    )
}

