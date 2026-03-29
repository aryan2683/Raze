import Foundation
import SwiftUI

enum AppColor: String, CaseIterable {
    case tertiary = "FF0055"
    case secondary = "1A1A1A"
    case primary = "00F0FF"
    case nuetral = "080808"
    case white = "FFFFFF"

    var color: Color {
        Color(hex: rawValue)
    }
}
