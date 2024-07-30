//
//  DashboardScreen.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

// Image url: https://avatars.githubusercontent.com/u/156512514?v=4

struct DashboardScreen: View {
    @State private var searchText = ""
    @State private var brandLogos = [
        "https://indieground.net/wp-content/uploads/2023/03/indieblog-nikelogohistory-15.jpg",
        "https://thumbs.dreamstime.com/b/vinnitsa-ukraine-october-puma-sport-brand-logo-icon-vector-editorial-illustration-vinnitsa-ukraine-october-puma-sport-brand-logo-260965689.jpg",
        "https://thumbs.dreamstime.com/b/vinnitsa-ukraine-october-adidas-sport-brand-logo-icon-vinnitsa-ukraine-october-adidas-sport-brand-logo-icon-vector-editorial-260965377.jpg",
        "https://cdn.dribbble.com/userupload/7908426/file/original-51795007992ed4fe7f1b22c458cf284e.jpg?resize=400x300&vertical=center",
        "https://cdn.dribbble.com/userupload/14817710/file/original-121ad254518757fb5df0089f7f5f0581.jpg?resize=400x0",
        "https://c8.alamy.com/comp/2KE4X1X/vinnitsa-ukraine-october-25-2022-asics-sport-brand-logo-icon-vector-editorial-illustration-2KE4X1X.jpg",
        "https://static.vecteezy.com/system/resources/previews/017/780/591/non_2x/dumbbell-icon-simple-style-fitness-sport-company-big-sale-poster-background-symbol-fitness-sport-logo-design-element-t-shirt-printing-for-sticker-vector.jpg"
    ]
    @State private var products = Product.dummyData
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 32) {
                    DashboardHeaderView()
                        .padding(.horizontal)
                    
                    DashboardSearchView(searchText: $searchText)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    
                    ShuffleCard(height: geo.size.width / 2)
                        .padding(.horizontal)
                    
                    DashboardBrandCarousel(brandLogos: brandLogos, screenSize: geo.size)
                        .padding(.horizontal)
                    
                    DashboardNewArrivalView(products: products, size: geo.size)
                }
            }
        }
    }
}

#Preview {
    DashboardScreen()
}

