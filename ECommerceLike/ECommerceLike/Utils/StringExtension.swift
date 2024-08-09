//
//  StringExtension.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        return self ?? ""
    }
}
