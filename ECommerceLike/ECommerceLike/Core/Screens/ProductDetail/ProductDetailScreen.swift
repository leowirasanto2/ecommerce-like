//
//  ProductDetailScreen.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 30/07/24.
//

import SwiftUI

struct ProductDetailScreen: View {
    @State var iconSize: CGFloat = 38
    @Environment(\.dismiss) var dismiss
    @State private var selectedSize = ""
    @State private var selectedDetailsTab = "Descriptions"
    @State private var isLoading = false
    @State private var isShowingMoreDetails = false
    private var imageCarouselData = [Color.red, Color.green, Color.blue, Color.brown]
    private var sizes = ["S", "M", "L", "XL", "XXL"]
    private var detailsTab = ["Descriptions", "Reviews", "Size Guides"]
    private var detailsTabContent = [
        ProductDetailScreen.productDesc,
        ProductDetailScreen.productReview,
        ProductDetailScreen.productSizeGuide
    ]
    
    @State private var detailsHeight: CGFloat = 400
    
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
                                ForEach(imageCarouselData, id: \.self) { item in
                                    Text("Product image slide")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(item)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            .frame(height: geo.size.height * 0.3)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                            
                            // Price
                            
                            HStack {
                                Text("$48")
                                    .font(.headline)
                                
                                Text("$51")
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
                            }
                            .padding(.horizontal)
                            
                            // Product name
                            Text("Product name here with max 2 lines")
                                .font(.headline)
                                .fontWeight(.medium)
                                .frame(width: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .padding(.horizontal)
                            
                            // Brand
                            HStack(alignment: .center, spacing: 16) {
                                AsyncImage(url: URL(string: Brand.dummyBrands[1].imageUrl ?? "")) { image in
                                    image.image?.resizable()
                                        .scaledToFill()
                                        .frame(width: .infinity, height: .infinity)
                                        .background(.black)
                                        .clipShape(Circle())
                                }
                                .frame(width: 30, height: 30)
                                
                                Text("Nike")
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
                                    ForEach(sizes, id: \.self) { item in
                                        Button {
                                            selectedSize = item
                                        } label: {
                                            Text(item)
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .background(item == selectedSize ? .black : .gray.opacity(0.1))
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .foregroundStyle(item == selectedSize ? .white : .black)
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
                                                Text(item)
                                                Rectangle()
                                                    .fill(item == selectedDetailsTab ? .black : .gray.opacity(0.2))
                                                    .frame(height: 1)
                                            }
                                            .frame(maxWidth: .infinity)
                                        }
                                        .foregroundStyle(.black)
                                    }
                                }
                                
                                TabView(selection: $selectedDetailsTab) {
                                    ForEach(detailsTabContent, id: \.self) { item in
                                        if getProductDetailsTag(item) == "Descriptions" {
                                            VStack {
                                                ProductDescView(descriptionContents: ProductDescriptionItem.dummyDesc1)
                                                
                                                Button {
                                                    isShowingMoreDetails.toggle()
                                                } label: {
                                                    Text("View more")
                                                        .font(.subheadline)
                                                        .padding()
                                                }
                                            }
                                            .tag("Descriptions")
                                        } else if getProductDetailsTag(item) == "Reviews" {
                                            VStack {
                                                ProductReviewView(reviews: ProductReview.dummyReviews)
                                                
                                                Button {
                                                    isShowingMoreDetails.toggle()
                                                } label: {
                                                    Text("View more")
                                                        .font(.subheadline)
                                                        .padding()
                                                }
                                            }
                                            .tag("Reviews")
                                        } else {
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
                                            .tag("Size Guides")
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
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                if isLoading {
                    LoadingView(searchText: "Fetching product details...")
                }
            }
        }
        .sheet(isPresented: $isShowingMoreDetails, content: {
            VStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.gray)
                    .frame(width: 40, height: 4)
                ScrollView {
                    switch selectedDetailsTab {
                    case "Descriptions":
                        ProductDescView(descriptionContents: ProductDescriptionItem.dummyDesc1)
                    case "Reviews":
                        ProductReviewView(reviews: ProductReview.dummyReviews)
                    default:
                        ProductSizeGuideView()
                    }
                }
            }
            .presentationDetents([.medium])
            .padding()
        })
        .navigationBarBackButtonHidden()
    }
    
    private func getProductDetailsTag(_ selected: String) -> String {
        if selected == ProductDetailScreen.productDesc {
            return "Descriptions"
        } else if selected == ProductDetailScreen.productReview {
            return "Reviews"
        } else {
            return "Size Guides"
        }
    }
}

#Preview {
    ProductDetailScreen()
}

extension ProductDetailScreen {
    static var productDesc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    static var productReview = "5 stars"
    
    static var productSizeGuide = "Hi! This is the size guide"
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
