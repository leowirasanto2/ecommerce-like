//
//  ShuffleCard.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct ShuffleCard: View {
    var height: CGFloat = 0
    
    var body: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(.black)
                .frame(height: height)
                .overlay {
                    Text("Shuffle card container")
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    ShuffleCard()
}
