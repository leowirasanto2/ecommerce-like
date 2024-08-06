//
//  SearchConfig.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 06/08/24.
//

import Foundation

struct SearchConfig {
    var keyword: String?
    var parameters: [String: Any] = [:]
    
    func parametersExists() -> Bool {
        return parameters.count > 1
    }
    
    mutating func resetConfig() {
        keyword = nil
        parameters = [:]
    }
    
    mutating func resetParameters() {
        parameters = [:]
    }
}

extension SearchConfig {
    static let brand = "brand_param"
    static let colors = "colors_param"
    static let minPrice = "min_price_param"
    static let maxPrice = "max_price_param"
}
