//
//  Product.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import Foundation

struct Product {
    var id = UUID().uuidString
    var name: String
    var imageUrl: String
    var price: Double
    var brand: Brand?
    
    func formattedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: price as NSNumber) ?? "-"
    }
}

extension Product {
    static var dummyData: [Product] = [
        .init(
            name: "Be Enough For Yourself Sticker",
            imageUrl: "https://dummyapparelco.com/cdn/shop/products/image_14e7fc0e-70f0-45bc-8cfd-f4d72ba3443d_590x.png?v=1676680261",
            price: 67000
        ),
        .init(
            name: "Oceanography: Koi Fish Long Sleeve Tee",
            imageUrl: "https://dummyapparelco.com/cdn/shop/files/IMG_1335_590x.heic?v=1700179208",
            price: 414000
        ),
        .init(
            name: "Oceanography: Jelly Fish Long Sleeve Tee",
            imageUrl: "https://dummyapparelco.com/cdn/shop/files/IMG_1714_590x.jpg?v=1701457914",
            price: 414000
        ),
        .init(
            name: "Variegated Monstera Beanie",
            imageUrl: "https://dummyapparelco.com/cdn/shop/files/E8C37CD9-8AA9-4483-AFF9-CF4A2C80B3AC_590x.jpg?v=1707074145",
            price: 414000
        ),
        .init(
            name: "Persimmon Tee",
            imageUrl: "https://dummyapparelco.com/cdn/shop/files/8D4AA253-75D9-4AEE-A1A5-48BE45A5BB7A_590x.jpg?v=1717875969",
            price: 497000
        )
    ]
}
