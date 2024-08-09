//
//  ColorExtensions.swift
//  ECommerceLike
//
//  Created by Leo Wirasanto Laia on 09/08/24.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color(.systemBackground)
    static let muteBackground = Color.gray.opacity(0.2)
    static let error = Color.red
    
    static func dynamic(light: Color, dark: Color) -> Color {
        let l = UIColor(light)
        let d = UIColor(dark)
        return UIColor.dynamicColor(light: l, dark: d).toColor
    }
}

extension UIColor {
    var toColor: Color {
        return Color(self)
    }
    
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
            guard #available(iOS 13.0, *) else { return light } // feel free to omit this if you are targeting only later iOS versions
            return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
        }
}
