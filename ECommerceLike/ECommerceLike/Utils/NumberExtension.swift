//
//  NumberExtension.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import Foundation

extension Double {
    var toCurrencyFormat: String {
        return String(format: "%.02f", self)
    }
    
    var usdCurrencyFormat: String {
        return self.formatted(.currency(code: "USD"))
    }
}
