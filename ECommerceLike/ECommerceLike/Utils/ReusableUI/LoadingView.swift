//
//  LoadingView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 08/08/24.
//

import SwiftUI

struct LoadingView: View {
    var loadingText: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(alignment: .center, spacing: 24) {
                ProgressView()
                    .colorInvert()
                    .scaleEffect(1.5)
                Text(loadingText)
                    .font(.footnote)
            }
            .foregroundStyle(.black)
            .padding(20)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.1))
    }
}

#Preview {
    LoadingView(loadingText: "Loading, please wait...")
}
