//
//  GenericNavbar.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 08/08/24.
//

import SwiftUI

typealias GenericNavBarButtonConfig = (Image, () -> ())

struct GenericNavbar: View {
    var iconSize: CGFloat = 38 //38 is default
    var title: String?
    var leftButton: GenericNavBarButtonConfig?
    var rightButton: GenericNavBarButtonConfig?
    
    var body: some View {
        HStack(alignment: .center) {
            if let leftButton = leftButton {
                Button {
                    leftButton.1()
                } label: {
                    Circle()
                        .strokeBorder(.gray)
                        .fill(.clear)
                        .background {
                            leftButton.0
                                .imageScale(.large)
                        }
                        .frame(width: iconSize, height: iconSize)
                }
                .foregroundStyle(.black)
                Spacer()
            }
            
            if let title = title {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            
            if let rightButton = rightButton {
                Spacer()
                Button {
                    rightButton.1()
                } label: {
                    Circle()
                        .strokeBorder(.gray)
                        .fill(.clear)
                        .background {
                            rightButton.0
                                .imageScale(.large)
                        }
                        .frame(width: iconSize, height: iconSize)
                }
                .foregroundStyle(.black)
            }
        }
        .padding()
    }
}

#Preview {
    GenericNavbar()
}
