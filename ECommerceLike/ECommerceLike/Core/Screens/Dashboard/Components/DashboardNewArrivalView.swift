//
//  DashboardNewArrivalView.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct DashboardNewArrivalView: View {
    var products: [Product] = []
    var size: CGSize = .zero
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("New arrivals")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("View all")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                }.hidden()
            }
            
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: size.width / 2.3, maximum: size.width / 2)),
                GridItem(.flexible(minimum: size.width / 2.3, maximum: size.width / 2))
            ] , spacing: 16) {
                    ForEach(products, id: \.id) { item in
                        Button {
                            
                        } label: {
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: item.imageUrl)) { img in
                                    img
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: .infinity, height: size.width / 2)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                } placeholder: {
                                    Color.clear
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(item.name)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                    
                                    Text(item.formattedPrice())
                                        .font(.footnote)
                                        .lineLimit(1)
                                }
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.leading)
                                .frame(width: .infinity, alignment: .leading)
                            }
                            .frame(width: size.width / 2.3, height: size.width / 1.4, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    DashboardNewArrivalView()
}
