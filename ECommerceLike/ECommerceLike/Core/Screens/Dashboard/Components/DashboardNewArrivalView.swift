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
    var didTap: (Product) -> ()
    var viewAll: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("New arrivals")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button {
                    viewAll()
                } label: {
                    Text("View all")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                }.hidden()
            }
            
            ProductGridContainer(screenSize: size, products: products, didTap: didTap)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ScrollView {
        GeometryReader { geo in
            DashboardNewArrivalView(products: Product.dummyData, size: geo.size) { product in } viewAll: { }
        }
    }
}
