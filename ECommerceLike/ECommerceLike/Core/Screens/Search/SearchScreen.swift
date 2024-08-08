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
    @Environment(\.dismiss) private var dismiss
    var onCancelled: () -> ()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    SearchBarWidget(searchState: initialState, showFilter: showFilter) { config in
                        keyword = config.keyword ?? ""
                        parameters = config.parameters
                    } onCancelled: {
                        dismiss()
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SearchScreen {}
}
