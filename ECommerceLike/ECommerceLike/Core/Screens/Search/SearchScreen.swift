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
    var onCancelled: () -> ()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    SearchBarWidget(searchState: initialState, showFilter: showFilter) { config in
                        keyword = config.keyword ?? ""
                        parameters = config.parameters
                    } onCancelled: {
                        onCancelled()
                    }
                    .padding(.horizontal)
                    
                    Text(keyword)
                    
                    ForEach(Array(parameters.keys), id: \.self) { key in
                        if let brand = parameters[key] as? Brand {
                            Text(brand.name)
                        }
                        if let text = parameters[key] as? String {
                            Text(text)
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    SearchScreen {}
}
