//
//  CartScreen.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import SwiftUI

struct CartScreen: View {
    @State var carts: [Cart] = Cart.dummyCart
    @State var selectionMode = false
    @State var totalPrice: Double = 0.0
    @State var isLoading = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                GenericNavbar(title: "Carts", leftButton: (Image(systemName: "arrow.left"), {
                    dismiss()
                }), rightButton: (Image(systemName: selectionMode ? "checkmark.rectangle.stack" : "pencil"), {
                    withAnimation {
                        if selectionMode {
                            deselectAll()
                        }
                        selectionMode.toggle()
                    }
                }))
                
                // MARK: - Scrollable Part
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("My Cart")
                            .font(.headline)
                            .padding()
                        
                        ForEach(carts, id: \.id) { item in
                            HStack(alignment: .center) {
                                if selectionMode && item.isActive {
                                    RadioButton(radioButtonSize: 15, state: item.isSelected ? .selected : .unselected) {
                                        setItemSelected(item.id)
                                    }.padding(.trailing, 8)
                                }
                                
                                AsyncImage(url: URL(string: item.selectedProduct.imageUrl)) { img in
                                    img.image?
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: .infinity, height: .infinity)
                                }
                                .frame(width: 55, height: 55)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(item.selectedProduct.name)
                                            .lineLimit(1)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text(item.appliedPrice.usdCurrencyFormat)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    if let brandName = item.selectedProduct.brand?.name {
                                        Text(brandName)
                                            .font(.subheadline)
                                            .fontWeight(.light)
                                    }
                                    
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.dynamic(light: .white, dark: .black))
                            .contextMenu {
                                Button {
                                    DispatchQueue.main.async {
                                        self.removeFromCart(item.id)
                                    }
                                } label: {
                                    Text("Remove from cart")
                                }
                                .foregroundStyle(.red)
                            }
                            .disabled(!item.isActive)
                            .opacity(item.isActive ? 1 : 0.5)
                        }
                    }
                }
                
                // MARK: - Bottom Part
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Total")
                        Spacer()
                        Text(totalPrice.toCurrencyFormat)
                    }
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button {
                        isLoading = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isLoading = false
                        }
                    } label: {
                        Text("Checkout")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.black)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.dynamic(light: .black, dark: .white), lineWidth: 1)
                    }
                }
                .padding()
            }
            
            if isLoading {
                LoadingView(loadingText: "Processing checkout...")
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private func removeFromCart(_ selectedId: String) {
        let selectedIndex = carts.firstIndex { cart in
            selectedId == cart.id
        }
        
        if let index = selectedIndex {
            self.carts.remove(at: index)
        }
    }
    
    private func setItemSelected(_ selectedId: String) {
        let selectedIndex = carts.firstIndex { cart in
            selectedId == cart.id
        }
        
        if let index = selectedIndex {
            self.carts[index].isSelected.toggle()
            
            let selectedPrices = self.carts.filter(\.isSelected).map { $0.appliedPrice }
            self.totalPrice = selectedPrices.reduce(0, +)
        }
    }
    
    private func deselectAll() {
        carts.enumerated().forEach { index, _ in
            carts[index].isSelected = false
        }
        
        self.totalPrice = 0
    }
}

#Preview {
    CartScreen(carts: Cart.dummyCart)
}
