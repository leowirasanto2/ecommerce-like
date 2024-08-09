//
//  ContentView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            DashboardScreen()
                .navigationDestination(for: Router.Destination.self) { selected in
                    switch selected {
                    case .searchScreen(let showFilter):
                        SearchScreen(initialState: .focused, showFilter: showFilter) {
                            router.back()
                        }
                    case .productDetail(let selectedProduct):
                        ProductDetailScreen(selectedProduct: selectedProduct)
                    case .cartScreen:
                        CartScreen()
                    }
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
