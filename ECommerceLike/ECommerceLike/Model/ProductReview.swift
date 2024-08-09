//
//  ProductReview.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import Foundation

struct ProductReview {
    var id = UUID().uuidString
    var curatorName: String
    var comment: String
}

extension ProductReview {
    static let dummyReviews: [ProductReview] = [
        .init(curatorName: "Anon", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        .init(curatorName: "Leo", comment: "Great!"),
        .init(curatorName: "Anon", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        .init(curatorName: "The Black Fire", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    ]
}
