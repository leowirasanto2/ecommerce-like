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
    
    var body: some View {
        ScrollView {
            GeometryReader { geo in
                VStack(spacing: 32) {
                    DashboardHeaderView()
                        .padding(.horizontal)
                    
                    DashboardSearchView(searchText: $searchText)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                            .frame(height: geo.size.width / 2)
                            .padding(.horizontal)
                            .overlay {
                                Text("Shuffle card container")
                                    .foregroundStyle(.white)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    DashboardScreen()
}
