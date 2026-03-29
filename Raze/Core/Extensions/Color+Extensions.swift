import Foundation
import SwiftUI

extension Color {
    init(hex: String, alpha: Double = 1) {
        let trimmed = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalized = trimmed.hasPrefix("#") ? String(trimmed.dropFirst()) : trimmed

        var hexValue: UInt64 = 0
        if Scanner(string: normalized).scanHexInt64(&hexValue) {
            switch normalized.count {
            case 6:
                let red = Double((hexValue & 0xFF0000) >> 16) / 255
                let green = Double((hexValue & 0x00FF00) >> 8) / 255
                let blue = Double(hexValue & 0x0000FF) / 255
                self = Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
                return
            case 8:
                let red = Double((hexValue & 0xFF000000) >> 24) / 255
                let green = Double((hexValue & 0x00FF0000) >> 16) / 255
                let blue = Double((hexValue & 0x0000FF00) >> 8) / 255
                let a = Double(hexValue & 0x000000FF) / 255
                self = Color(.sRGB, red: red, green: green, blue: blue, opacity: a)
                return
            default:
                break
            }
        }

        self = Color(.sRGB, red: 0, green: 0, blue: 0, opacity: alpha)
    }
}
