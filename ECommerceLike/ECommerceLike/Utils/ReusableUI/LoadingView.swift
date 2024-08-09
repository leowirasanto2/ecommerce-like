//
//  LoadingView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 08/08/24.
//

import SwiftUI

struct LoadingView: View {
    var searchText: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(alignment: .center, spacing: 24) {
                ProgressView()
                    .scaleEffect(1.5)
                Text(searchText)
                    .font(.footnote)
            }
            .padding(20)
            .background(Color.dynamic(light: .white, dark: .gray.opacity(0.5)))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.1))
    }
}

#Preview {
    LoadingView(searchText: "Loading, please wait...")
}
