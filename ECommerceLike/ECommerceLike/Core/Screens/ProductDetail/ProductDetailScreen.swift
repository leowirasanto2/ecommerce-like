//
//  ProductDetailScreen.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct ProductDetailScreen: View {
    var selectedProduct: Product?
    @State var iconSize: CGFloat = 38
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var router: Router
    @State private var selectedSize: ProductSize = .L
    @State private var isLoading = false
    @State private var isShowingMoreDetails = false
    @State private var allSizes = ProductSize.allCases
    @State private var selectedDetailsTab: DetailsInformationTab = .descriptions
    @State private var isShowingFullscreenImage = false
    private var detailsTab = DetailsInformationTab.allCases
    
    @State private var detailsHeight: CGFloat = 400
    
    init(selectedProduct: Product? = nil) {
        self.selectedProduct = selectedProduct
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                VStack(alignment: .center, spacing: 0) {
                    GenericNavbar(
                        title: "Product detail",
                        leftButton: (Image(systemName: "arrow.backward"), {
                            dismiss()
                        }),
                        rightButton: (Image(systemName: "heart"), {
                            
                        })
                    )
                    
                    // Content
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Image carousel
                            TabView {
                                ForEach(selectedProduct?.carouselImageUrls ?? [], id: \.self) { item in
                                    AsyncImage(url: URL(string: item)) { img in
                                        img.image?
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: .infinity, height: .infinity)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .onTapGesture {
                                        self.isShowingFullscreenImage = true
                                    }
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            .frame(height: geo.size.height * 0.3)
                            .background(.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                            
                            // Price
                            
                            HStack {
                                if let discountPrice = selectedProduct?.discountPrice {
                                    Text("\(discountPrice.usdCurrencyFormat)")
                                        .font(.headline)
                                    
                                    Text("\((selectedProduct?.price ?? 0.0).usdCurrencyFormat)")
                                        .font(.subheadline)
                                        .fontWeight(.regular)
                                        .strikethrough()
                                        .foregroundStyle(.gray)
                                    
                                    Spacer()
                                    
                                    Text("20% off")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.green)
                                        .padding(4)
                                        .background(.green.opacity(0.3))
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                } else {
                                    Text("\((selectedProduct?.price ?? 0.0).usdCurrencyFormat)")
                                        .font(.headline)
                                    
                                    Spacer()
                                }
                                
                            }
                            .padding(.horizontal)
                            
                            // Product name
                            Text(selectedProduct?.name ?? "")
                                .font(.headline)
                                .fontWeight(.medium)
                                .frame(width: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .padding(.horizontal)
                            
                            // Brand
                            HStack(alignment: .center, spacing: 16) {
                                AsyncImage(url: URL(string: selectedProduct?.brand?.imageUrl ?? "")) { image in
                                    image.image?.resizable()
                                        .scaledToFill()
                                        .frame(width: .infinity, height: .infinity)
                                        .background(.black)
                                        .clipShape(Circle())
                                }
                                .frame(width: 30, height: 30)
                                
                                Text(selectedProduct?.brand?.name ?? "")
                                    .fontWeight(.regular)
                                    .foregroundStyle(.gray)
                                
                            }
                            .padding(.horizontal)
                            
                            // Size Selection
                            VStack(alignment: .leading, spacing: 16) {
                                // Select size
                                Text("Select size")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                HStack(alignment: .center, spacing: 16) {
                                    ForEach(allSizes, id: \.self) { item in
                                        Button {
                                            selectedSize = item
                                        } label: {
                                            Text(item.rawValue)
                                                .font(.caption)
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .background(sizeButtonBackgroundColor(item))
                                        }
                                        .disabled(selectedProduct?.availableSize.contains(item) == false)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .foregroundStyle(sizeButtonForegroundColor(item))
                                        .opacity(sizeButtonOpacity(item))
                                    }
                                }
                            }
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(alignment: .center, spacing: 0) {
                                    ForEach(detailsTab, id: \.self) { item in
                                        Button {
                                            withAnimation {
                                                selectedDetailsTab = item
                                            }
                                        } label: {
                                            VStack {
                                                Text(item.title)
                                                Rectangle()
                                                    .fill(item == selectedDetailsTab ? (Color.dynamic(light: .black, dark: .white)) : .gray.opacity(colorScheme == .dark ? 0.8 : 0.2))
                                                    .frame(height: 1)
                                            }
                                            .frame(maxWidth: .infinity)
                                        }
                                        .foregroundStyle(Color.dynamic(light: .black, dark: .white))
                                    }
                                }
                                
                                TabView(selection: $selectedDetailsTab) {
                                    ForEach(detailsTab, id: \.self) { item in
                                        if let content = selectedProduct?.details?.descriptions, !content.isEmpty, item == .descriptions {
                                            VStack {
                                                ProductDescView(descriptionContents: content)
                                                
                                                Button {
                                                    isShowingMoreDetails.toggle()
                                                } label: {
                                                    Text("View more")
                                                        .font(.subheadline)
                                                        .padding()
                                                }
                                            }
                                            .tag(item)
                                        } else if let content = selectedProduct?.details?.reviews, !content.isEmpty, item == .reviews {
                                            VStack {
                                                ProductReviewView(reviews: content)
                                                
                                                Button {
                                                    isShowingMoreDetails.toggle()
                                                } label: {
                                                    Text("View more")
                                                        .font(.subheadline)
                                                        .padding()
                                                }
                                            }
                                            .tag(item)
                                        } else if let content = selectedProduct?.details?.sizeGuides, !content.isEmpty, item == .sizeGuides {
                                            VStack {
                                                ProductSizeGuideView()
                                                
                                                Button {
                                                    isShowingMoreDetails.toggle()
                                                } label: {
                                                    Text("View more")
                                                        .font(.subheadline)
                                                        .padding()
                                                }
                                            }
                                            .tag(item)
                                        } else {
                                            AnyView(EmptyView())
                                        }
                                    }
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .frame(height: detailsHeight, alignment: .top)
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                Button {
                                    isLoading = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        self.isLoading = false
                                        self.router.navigateTo(.cartScreen)
                                    }
                                } label: {
                                    Text("Add to cart")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(.white)
                                        .foregroundStyle(.black)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 1)
                                }
                                
                                Button {
                                    isLoading = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        self.isLoading = false
                                    }
                                } label: {
                                    Text("Buy now")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(.black)
                                        .foregroundStyle(.white)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.dynamic(light: .black, dark: .white), lineWidth: 1)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                if isLoading {
                    LoadingView(loadingText: "Fetching product details...")
                }
            }
        }
        .sheet(isPresented: $isShowingMoreDetails, content: {
            VStack(spacing: 16) {
                ScrollView {
                    switch selectedDetailsTab {
                    case .descriptions:
                        ProductDescView(descriptionContents: selectedProduct?.details?.descriptions ?? [])
                    case .reviews:
                        ProductReviewView(reviews: selectedProduct?.details?.reviews ?? [])
                    default:
                        ProductSizeGuideView()
                    }
                }
            }
            .presentationDetents([.medium, .large])
            .padding()
        })
        .sheet(isPresented: $isShowingFullscreenImage, content: {
            FullscreenImagePreview(imageUrls: selectedProduct?.carouselImageUrls ?? [])
        })
        .navigationBarBackButtonHidden()
    }
    
    private func sizeButtonBackgroundColor(_ itemSize: ProductSize) -> Color {
        if let availableSize = selectedProduct?.availableSize, !availableSize.contains(itemSize) {
            return .dynamic(light: .black.opacity(0.2), dark: .gray.opacity(0.5))
        } else if selectedSize == itemSize {
            return .dynamic(light: .black, dark: .green)
        } else {
            return .dynamic(light: .gray.opacity(0.1), dark: .gray)
        }
    }
    
    private func sizeButtonForegroundColor(_ itemSize: ProductSize) -> Color {
        if let availableSize = selectedProduct?.availableSize, !availableSize.contains(itemSize) {
            return .dynamic(light: .black.opacity(0.3), dark: .white)
        } else if selectedSize == itemSize {
            return .white
        } else {
            return .black
        }
    }
    
    private func sizeButtonOpacity(_ itemSize: ProductSize) -> CGFloat {
        if let availableSize = selectedProduct?.availableSize, !availableSize.contains(itemSize) {
            return 0.3
        }
        return 1
    }
}

#Preview {
    ProductDetailScreen(selectedProduct: .dummyData.first)
        .environmentObject(Router())
}

extension ProductDetailScreen {
    static var productDesc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    static var productReview = "5 stars"
    
    static var productSizeGuide = "Hi! This is the size guide"
}
