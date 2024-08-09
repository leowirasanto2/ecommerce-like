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
    @State private var brands = Brand.dummyBrands
    @State private var products = Product.dummyData
    @EnvironmentObject var router: Router
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 32) {
                    DashboardHeaderView()
                        .padding(.horizontal)
                    
                    DashboardSearchView { withFilter in
                        router.navigateTo(.searchScreen(showFilter: withFilter))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)

                    ShuffleCard(height: geo.size.width / 2)
                        .padding(.horizontal)
                    
                    DashboardBrandCarousel(brandLogos: brands.filter {$0.id != "brand-default" }.map(\.imageUrl), screenSize: geo.size)
                        .padding(.horizontal)
                    
                    DashboardNewArrivalView(products: products, size: geo.size) { product in
                        router.navigateTo(.productDetail(selectedProduct: product))
                    } viewAll: {}
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DashboardScreen()
            .environmentObject(Router())
    }
}

