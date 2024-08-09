//
//  Product.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import Foundation

struct Product: Codable, Hashable {
    var id = UUID().uuidString
    var name: String
    var imageUrl: String
    var price: Double
    var discountPrice: Double?
    var brand: Brand?
    var details: ProductDetails?
    var availableSize: [ProductSize] = []
    var carouselImageUrls: [String] = []
    
    func formattedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: price as NSNumber) ?? "-"
    }
}

struct ProductDetails: Codable, Hashable {
    var descriptions: [ProductDescriptions] = []
    var reviews: [ProductReviews] = []
    var sizeGuides: [ProductSizeGuides] = []
}

enum DetailsInformationTab: Int, CaseIterable, Codable {
    case descriptions = 0
    case reviews = 1
    case sizeGuides = 2
    
    var title: String {
        switch self {
        case .descriptions:
            "Descriptions"
        case .reviews:
            "Reviews"
        case .sizeGuides:
            "Size Guides"
        }
    }
}

struct ProductDescriptions: Codable, Hashable {
    var id = UUID().uuidString
    var title: String?
    var content: String
}

struct ProductReviews: Codable, Hashable {
    var id = UUID().uuidString
    var curatorName: String
    var comment: String
}

struct ProductSizeGuides: Codable, Hashable {
    var id = UUID().uuidString
    var title: String?
    var contentDescription: String
}

enum ProductSize: String, CaseIterable, Hashable, Codable {
    case S = "S"
    case M = "M"
    case L = "L"
    case XL = "XL"
    case XXL = "XXL"
    case XXXL = "XXXL"
}

// MARK: - Dummy data

extension ProductReviews {
    static let dummyReviews: [ProductReviews] = [
        .init(curatorName: "Anon", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        .init(curatorName: "Leo", comment: "Great!"),
        .init(curatorName: "Anon", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        .init(curatorName: "The Black Fire", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    ]
}

extension ProductDetails {
    static let dummyDetails: ProductDetails = .init(descriptions: ProductDescriptions.dummyDesc, reviews: ProductReviews.dummyReviews, sizeGuides: ProductSizeGuides.dummySize)
}

extension ProductDescriptions {
    static var dummyDesc: [ProductDescriptions] = [
        .init(title: "About", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        .init(title: "Usage", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."),
        .init(title: "Additional Information", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
    ]
}

extension ProductSizeGuides {
    static let dummySize: [ProductSizeGuides] = [
        .init(title: "L", contentDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        .init(title: "XL", contentDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        .init(title: "XXL", contentDescription: "Lorem ipsum dolor sit amet")
    ]
}

extension Product {
    static var dummyData: [Product] = [
        .init(
            name: "Be Enough For Yourself Sticker",
            imageUrl: "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/c08423f2-fd4b-4695-8ac0-6ebfaac41d5f/nike-lookbook.jpg",
            price: 76,
            discountPrice: 70,
            brand: .dummyBrands[1],
            details: .dummyDetails,
            availableSize: [.L, .M, .XL],
            carouselImageUrls: [
                "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/c08423f2-fd4b-4695-8ac0-6ebfaac41d5f/nike-lookbook.jpg",
                "https://dummyapparelco.com/cdn/shop/products/image_14e7fc0e-70f0-45bc-8cfd-f4d72ba3443d_590x.png?v=1676680261",
                "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/df89676e-ed60-47bb-ab35-f61aa3cf2f59/image.jpg"
            ]
        ),
        .init(
            name: "Oceanography: Koi Fish Long Sleeve Tee",
            imageUrl: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/393058/01/mod02/fnd/IDN/fmt/png/Sepatu-Sneaker-Wanita-Mayze-Stack-Fashion",
            price: 41,
            brand: .dummyBrands[2],
            details: .dummyDetails,
            availableSize: [.M, .L, .XL, .XXL],
            carouselImageUrls: [
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/393058/01/mod02/fnd/IDN/fmt/png/Sepatu-Sneaker-Wanita-Mayze-Stack-Fashion",
                "https://dummyapparelco.com/cdn/shop/files/IMG_1335_590x.heic?v=1700179208"
            ]
        ),
        .init(
            name: "Oceanography: Jelly Fish Long Sleeve Tee",
            imageUrl: "https://media.voguebusiness.com/photos/63daa21650fb254a8de71041/2:3/w_2560%2Cc_limit/adidas-launch-voguebus-photographer-month-22-story.jpg",
            price: 24,
            brand: .dummyBrands[3],
            details: .dummyDetails,
            availableSize: [.M, .L, .XL, .XXL],
            carouselImageUrls: [
                "https://media.voguebusiness.com/photos/63daa21650fb254a8de71041/2:3/w_2560%2Cc_limit/adidas-launch-voguebus-photographer-month-22-story.jpg",
                "https://media1.popsugar-assets.com/files/thumbor/ybcu9RRhF9M8uSQU6UWTIUwAWq0=/0x726:3000x3804/fit-in/792x1056/filters:format_auto():upscale()/2021/03/05/699/n/1922564/6921a34260425288480df4.25855052_.jpg",
                "https://dummyapparelco.com/cdn/shop/files/IMG_1714_590x.jpg?v=1701457914"
            ]
        ),
        .init(
            name: "Variegated Monstera Beanie",
            imageUrl: "https://dummyapparelco.com/cdn/shop/files/E8C37CD9-8AA9-4483-AFF9-CF4A2C80B3AC_590x.jpg?v=1707074145",
            price: 77,
            brand: .dummyBrands[4],
            details: .dummyDetails,
            availableSize: [.L, .M, .XL],
            carouselImageUrls: [
                "https://www.blibli.com/friends-backend/wp-content/uploads/2023/05/B400294-Cover-Apa-Perbedaan-Fashion-dan-Style-1.jpg",
                "https://dummyapparelco.com/cdn/shop/files/E8C37CD9-8AA9-4483-AFF9-CF4A2C80B3AC_590x.jpg?v=1707074145"
            ]
        ),
        .init(
            name: "Persimmon Tee",
            imageUrl: "https://dummyapparelco.com/cdn/shop/files/8D4AA253-75D9-4AEE-A1A5-48BE45A5BB7A_590x.jpg?v=1717875969",
            price: 89,
            brand: .dummyBrands[5],
            details: .dummyDetails,
            availableSize: [.M, .L, .XL, .XXL],
            carouselImageUrls: [
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB9oBqzanCKQoqvZMq9QmdBPndC93klGGJZQ&s",
                "https://dummyapparelco.com/cdn/shop/files/8D4AA253-75D9-4AEE-A1A5-48BE45A5BB7A_590x.jpg?v=1717875969"
            ]
        )
    ]
}
