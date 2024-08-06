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
    @State private var showSearchSheet = false
    @State private var showFilter = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 32) {
                    DashboardHeaderView()
                        .padding(.horizontal)
                    DashboardSearchView {
                        showSearchSheet = true
                        showFilter = false
                    } filterTapped: {
                        showFilter = true
                        showSearchSheet = true
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)

                    ShuffleCard(height: geo.size.width / 2)
                        .padding(.horizontal)
                    
                    DashboardBrandCarousel(brandLogos: brands.filter {$0.id != "brand-default" }.map(\.imageUrl), screenSize: geo.size)
                        .padding(.horizontal)
                    
                    DashboardNewArrivalView(products: products, size: geo.size)
                }
            }
            .fullScreenCover(isPresented: $showSearchSheet, onDismiss: {
                showFilter = false
            }, content: {
                SearchScreen(initialState: .focused, showFilter: showFilter) {
                    showSearchSheet = false
                    print(showSearchSheet)
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        DashboardScreen()
    }
}

