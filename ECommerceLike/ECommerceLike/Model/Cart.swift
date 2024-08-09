//
//  Cart.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import Foundation

struct Cart {
    var id = UUID().uuidString
    var qty: Int
    var selectedProduct: Product
    var selectedSize: ProductSize
    var appliedPrice: Double
    var isActive = true
    var isSelected = false
}

extension Cart {
    static var dummyCart: [Cart] = [
        .init(qty: 2, selectedProduct: .dummyData[1], selectedSize: .L, appliedPrice: Product.dummyData[1].price),
        .init(qty: 3, selectedProduct: .dummyData[2], selectedSize: .S, appliedPrice: Product.dummyData[2].price),
        .init(qty: 1, selectedProduct: .dummyData[3], selectedSize: .XXL, appliedPrice: Product.dummyData[3].price, isActive: false)
    ]
}
