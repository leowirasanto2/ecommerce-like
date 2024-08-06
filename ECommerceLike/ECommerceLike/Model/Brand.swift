//
//  Brand.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 06/08/24.
//

import Foundation

struct Brand: Hashable {
    var id: String
    var name: String
    var imageUrl: String?
}

extension Brand {
    static var defaultBrand: Brand = .init(id: "brand-default", name: "All")
    
    static var dummyBrands: [Brand] = [
        .defaultBrand,
        .init(id: "brand-2", name: "Nike", imageUrl: "https://indieground.net/wp-content/uploads/2023/03/indieblog-nikelogohistory-15.jpg"),
        .init(id: "brand-3", name: "Puma", imageUrl: "https://thumbs.dreamstime.com/b/vinnitsa-ukraine-october-puma-sport-brand-logo-icon-vector-editorial-illustration-vinnitsa-ukraine-october-puma-sport-brand-logo-260965689.jpg"),
        .init(id: "brand-4", name: "Adidas", imageUrl: "https://thumbs.dreamstime.com/b/vinnitsa-ukraine-october-adidas-sport-brand-logo-icon-vinnitsa-ukraine-october-adidas-sport-brand-logo-icon-vector-editorial-260965377.jpg"),
        .init(id: "brand-5", name: "NJord", imageUrl: "https://cdn.dribbble.com/userupload/7908426/file/original-51795007992ed4fe7f1b22c458cf284e.jpg?resize=400x300&vertical=center"),
        .init(id: "brand-6", name: "S", imageUrl: "https://cdn.dribbble.com/userupload/14817710/file/original-121ad254518757fb5df0089f7f5f0581.jpg?resize=400x0"),
        .init(id: "brand-7", name: "Asics", imageUrl: "https://c8.alamy.com/comp/2KE4X1X/vinnitsa-ukraine-october-25-2022-asics-sport-brand-logo-icon-vector-editorial-illustration-2KE4X1X.jpg"),
        .init(id: "brand-8", name: "Go Dumbell", imageUrl: "https://static.vecteezy.com/system/resources/previews/017/780/591/non_2x/dumbbell-icon-simple-style-fitness-sport-company-big-sale-poster-background-symbol-fitness-sport-logo-design-element-t-shirt-printing-for-sticker-vector.jpg")
        
    ]
}
