//
//  RadioButton.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 10/08/24.
//

import SwiftUI

struct RadioButton: View {
    enum ButtonState {
        case selected
        case unselected
    }
    
    var radioButtonSize: CGFloat = 15
    var state: ButtonState = .unselected
    var didSelect: () -> ()
    
    var body: some View {
        VStack {
            Button {
                didSelect()
            } label: {
                Image(systemName: state == .selected ? "checkmark.circle.fill" : "checkmark.circle")
                    .resizable()
                    .scaledToFit()
            }
            .foregroundStyle(state == .selected ? .green : .gray)
            .frame(maxWidth: radioButtonSize, maxHeight: radioButtonSize)
        }
    }
}

#Preview {
    RadioButton() {}
}
