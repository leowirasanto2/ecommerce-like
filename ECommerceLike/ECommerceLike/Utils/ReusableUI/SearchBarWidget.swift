//
//  SearchBarWidget.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 06/08/24.
//

import SwiftUI

struct SearchBarWidget: View {
    enum FocusedField {
        case searchBar
    }
    
    @State private var searchText: String = ""
    @State private var searchConfig: SearchConfig = .init()
    @State private var selectedBrand: Brand = .defaultBrand
    @State private var minPrice: String = ""
    @State private var maxPrice: String = ""
    @State var availableBrands: [Brand] = Brand.dummyBrands
    @State var searchState: SearchBarWidgetState = .initial
    @State var searchBarHeight: CGFloat = 60
    @State var showFilter: Bool = true
    @FocusState private var focusedField: FocusedField?
    
    var onSubmit: (SearchConfig) -> ()
    var onCancelled: () -> ()
    
    var body: some View {
        VStack {
            
            switch searchState {
            case .initial:
                // Initial
                HStack(alignment: .center) {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    Text("Search product")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.gray.opacity(0.5))
                        .onTapGesture {
                            withAnimation {
                                searchState = .focused
                            }
                        }
                    
                    Divider()
                    
                    Button {
                        withAnimation {
                            searchState = .focused
                            showFilter = true
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .imageScale(.medium)
                    }
                    .foregroundStyle(Color.dynamic(light: .black, dark: .gray.opacity(0.5)))
                }
                .padding()
                .frame(height: searchBarHeight)
                .background(.gray.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            case .focused:
                // Focused
                VStack(alignment: .center, spacing: 20) {
                    HStack(alignment: .center) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundStyle(.gray.opacity(0.5))
                        
                        TextField("Search product", text: $searchText)
                            .focused($focusedField, equals: .searchBar)
                            .onSubmit {
                                searchState = .applied
                                onSubmit(
                                    .init(
                                        keyword: searchText,
                                        parameters: generateParameters()
                                    )
                                )
                            }
                            .foregroundStyle(Color.dynamic(light: .black, dark: .white))
                        
                        Button {
                            withAnimation {
                                if !showFilter && !parametersExists() {
                                    showFilter = true
                                }
                                
                                if showFilter && parametersExists() {
                                    minPrice = ""
                                    maxPrice = ""
                                    selectedBrand = .defaultBrand
                                    searchConfig.resetParameters()
                                    showFilter = false
                                }
                            }
                        } label: {
                            Image(systemName: parametersExists() ? "slider.horizontal.2.gobackward" : "slider.horizontal.3")
                                .imageScale(.medium)
                                .foregroundStyle(parametersExists() ? .red : Color.dynamic(light: .black, dark: .gray.opacity(0.5)))
                        }
                        
                        // MARK: - Cancel search
                        Button {
                            withAnimation {
                                searchState = .initial
                                searchText = ""
                                minPrice = ""
                                maxPrice = ""
                                selectedBrand = .defaultBrand
                                showFilter = false
                                searchConfig.resetConfig()
                                onCancelled()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .imageScale(.medium)
                        }
                        .foregroundStyle(Color.dynamic(light: .black, dark: .gray.opacity(0.5)))
                    }
                    .padding(.horizontal)
                    .frame(height: searchBarHeight)
                    .background()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray.opacity(0.5), radius: 5)
                    
                    if showFilter {
                        VStack {
                            HStack(spacing: 16) {
                                Text("Brand")
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                                
                                Picker("Brand Filter", selection: $selectedBrand) {
                                    ForEach(availableBrands, id: \.id) { item in
                                        Text(item.name)
                                            .tag(item)
                                    }
                                }
                                .frame(width: 200, height: searchBarHeight)
                                .background(.gray.opacity(0.05))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                            HStack(spacing: 16) {
                                Text("Min. price")
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                                
                                TextField("Minimal price", text: $minPrice)
                                    .padding(.horizontal)
                                    .frame(width: 200, height: searchBarHeight)
                                    .background(.gray.opacity(0.05))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .keyboardType(.numberPad)
                            }
                            
                            HStack(spacing: 16) {
                                Text("Max. price")
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                                
                                TextField("Maximum price", text: $maxPrice)
                                    .padding(.horizontal)
                                    .frame(width: 200, height: searchBarHeight)
                                    .background(.gray.opacity(0.05))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .keyboardType(.numberPad)
                            }
                        }
                        .padding()
                        .background(Color.dynamic(light: .white, dark: .black))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .gray.opacity(0.5), radius: 5)
                    }
                    
                    Button {
                        withAnimation {
                            showFilter.toggle()
                        }
                    } label: {
                        Text(showFilter ? "Hide filter" : "Show filter")
                            .font(.footnote)
                    }
                    .padding(8)
                    .background()
                    .foregroundStyle(Color.dynamic(light: .black, dark: .white))
                    .clipShape(RoundedRectangle(cornerRadius: .infinity))
                    .shadow(color: .gray.opacity(0.5), radius: 5)
                }
                .onAppear {
                    focusedField = .searchBar
                }
            case .applied:
                // Applied
                HStack(alignment: .center) {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    Text(searchText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        withAnimation {
                            searchState = .initial
                            searchText = ""
                            minPrice = ""
                            maxPrice = ""
                            selectedBrand = .defaultBrand
                            showFilter = false
                            searchConfig.resetConfig()
                            onCancelled()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .imageScale(.medium)
                    }
                    .foregroundStyle(Color.dynamic(light: .black, dark: .gray.opacity(0.5)))
                }
                .padding()
                .frame(height: searchBarHeight)
                .background(.gray.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    withAnimation {
                        searchState = .focused
                    }
                }
            }
        }
    }
    
    func parametersExists() -> Bool {
        return selectedBrand != .defaultBrand || !minPrice.isEmpty || !maxPrice.isEmpty
    }
    
    func generateParameters() -> [String: Any] {
        var result: [String: Any] = [:]
        if selectedBrand != .defaultBrand {
            result[SearchConfig.brand] = selectedBrand
        }
        
        if !minPrice.isEmpty {
            result[SearchConfig.minPrice] = minPrice
        }
        
        if !maxPrice.isEmpty {
            result[SearchConfig.maxPrice] = maxPrice
        }
        
        return result
    }
}

#Preview {
    SearchBarWidget { config in
        //
    } onCancelled: {
        //
    }

}

enum SearchBarWidgetState {
    case initial
    case focused
    case applied
}
