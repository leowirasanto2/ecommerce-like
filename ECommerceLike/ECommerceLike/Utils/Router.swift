//
//  Router.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 08/08/24.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    public enum Destination: Codable, Hashable {
        case searchScreen(showFilter: Bool)
        case productDetail(selectedProduct: Product)
    }
    
    @Published var navigationPath = NavigationPath()
    
    func navigateTo(_ destination: Destination) {
        navigationPath.append(destination)
    }
    
    func back() {
        navigationPath.removeLast()
    }
    
    func toRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
