//
//  DashboardHeaderView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct DashboardHeaderView: View {
    @State private var avatarSize: CGFloat = 38
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(
                url: URL(string: "https://avatars.githubusercontent.com/u/156512514?v=4")) { img in
                    img.resizable()
                        .scaledToFit()
                        .frame(width: avatarSize, height: avatarSize)
                } placeholder: {
                    Circle()
                        .fill(.gray)
                        .frame(width: avatarSize, height: avatarSize)
                }
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Welcome back")
                    .font(.footnote)
                    .fontWeight(.light)
                Text("Leo Wirasanto Laia")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Circle()
                    .strokeBorder(.gray)
                    .fill(.clear)
                    .background {
                        Image(systemName: "bell")
                            .imageScale(.large)
                    }
                    .frame(width: avatarSize, height: avatarSize)
            }
            .foregroundStyle(Color.dynamic(light: .black, dark: .white))
            
            Button {
                
            } label: {
                Circle()
                    .strokeBorder(.gray)
                    .fill(.clear)
                    .background {
                        Image(systemName: "person")
                            .imageScale(.large)
                    }
                    .frame(width: avatarSize, height: avatarSize)
            }
            .foregroundStyle(Color.dynamic(light: .black, dark: .white))
        }
    }
}

#Preview {
    DashboardHeaderView()
}
