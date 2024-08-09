//
//  DashboardSearchView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct DashboardSearchView: View {
    @State var height: CGFloat = 60
    var searchbarTapped: (_ withFilter: Bool) -> ()
    
    var body: some View {
        HStack(alignment: .center) {
            Group {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .foregroundStyle(.gray.opacity(0.5))
                
                Text("Type to search product").foregroundStyle(.gray.opacity(0.5))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .onTapGesture {
                searchbarTapped(false)
            }
            
            Divider()
            
            Button {
                searchbarTapped(true)
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .imageScale(.large)
            }
            .foregroundStyle(Color.dynamic(light: .black, dark: .white))
        }
        .padding()
        .frame(height: height)
        .background(Color.dynamic(light: .gray.opacity(0.05), dark: .white.opacity(0.1)))
    }
}

#Preview {
    DashboardSearchView { withFilter in }
}
