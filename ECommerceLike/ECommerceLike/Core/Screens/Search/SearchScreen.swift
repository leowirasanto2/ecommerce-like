//
//  SearchScreen.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 06/08/24.
//

import SwiftUI

struct SearchScreen: View {
    var initialState: SearchBarWidgetState = .focused
    var showFilter = true
    @State private var keyword = ""
    @State private var parameters: [String: Any] = [:]
    @State private var searchResult: [Product] = []
    @State private var isSearching = false
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var router: Router
    var onCancelled: () -> ()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                // Content
                ScrollView {
                    VStack(alignment: .leading) {
                        SearchBarWidget(searchState: initialState, showFilter: showFilter) { config in
                            keyword = config.keyword ?? ""
                            parameters = config.parameters
                            toggleLoading(true)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.searchResult = Product.dummyData
                                self.toggleLoading(false)
                            }
                        } onCancelled: {
                            dismiss()
                        }
                        .padding(.horizontal)
                        
                        if !searchResult.isEmpty {
                            VStack(alignment: .leading) {
                                Text("Search result of \"\(keyword)\"")
                                    .font(.subheadline)
                                
                                SearchResultView(products: searchResult, screenSize: geo.size) { product in
                                    router.navigateTo(.productDetail(productId: product.id))
                                }
                            }
                            .padding()
                        }
                    }
                    .padding(.top)
                }
                
                // Loader
                if isSearching {
                    LoadingView(searchText: "Searching, please wait...")
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func toggleLoading(_ active: Bool) {
        withAnimation {
            isSearching = active
        }
    }
}

#Preview {
    SearchScreen {}
        .environmentObject(Router())
}
