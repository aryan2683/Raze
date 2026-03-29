import Foundation

import SwiftUI

struct FontMapper {

    struct TextStyle {
        let font: Font
        let color: Color
        let tracking: CGFloat
    }

    static func textStyle(
        family: AppFontFamily = .manrope,
        _ style: AppFontStyle = .regular,
        size: AppFontSize = .f16,
        color: AppColor = .nuetral,
        tracking: CGFloat = 0
    ) -> TextStyle {
        TextStyle(
            font: Font.custom(fontName(for: family, style: style), size: size.rawValue),
            color: color.color,
            tracking: tracking
        )
    }

    static func font(
        family: AppFontFamily = .manrope,
        _ style: AppFontStyle = .regular,
        size: AppFontSize = .f16
    ) -> Font {
        textStyle(family: family, style, size: size).font
    }

    private static func fontName(for family: AppFontFamily, style: AppFontStyle) -> String {
        switch (family, style) {
        case (.manrope, .regular): return "Manrope-Regular"
        case (.manrope, .medium): return "Manrope-Medium"
        case (.manrope, .semiBold): return "Manrope-Bold"
        case (.manrope, .bold): return "Manrope-Bold"
        case (.manrope, .extraBold): return "Manrope-ExtraBold"
        case (.spaceGrotesk, .regular): return "SpaceGrotesk-Regular"
        case (.spaceGrotesk, .medium): return "SpaceGrotesk-Medium"
        case (.spaceGrotesk, .semiBold): return "SpaceGrotesk-SemiBold"
        case (.spaceGrotesk, .bold): return "SpaceGrotesk-Bold"
        case (.spaceGrotesk, .extraBold): return "SpaceGrotesk-Bold"
        }
    }
}

private struct FontMapperStyleModifier: ViewModifier {
    let style: FontMapper.TextStyle

    func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundColor(style.color)
            .tracking(style.tracking)
    }
}

extension View {
    func appFontStyle(_ style: FontMapper.TextStyle) -> some View {
        modifier(FontMapperStyleModifier(style: style))
    }
}
