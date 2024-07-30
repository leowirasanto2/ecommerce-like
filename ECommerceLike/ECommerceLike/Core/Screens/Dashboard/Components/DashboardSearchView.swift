//
//  DashboardSearchView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct DashboardSearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundStyle(.gray.opacity(0.5))
            
            TextField("Search product", text: $searchText)
            
            Divider()
            
            Button {
                
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .imageScale(.large)
            }
            .foregroundStyle(.black)
        }
        .padding()
        .background(.gray.opacity(0.05))
    }
}

#Preview {
    DashboardSearchView(searchText: .constant(""))
}
