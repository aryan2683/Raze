import SwiftUI

struct SplashHeroCopyView: View {
    let title: String
    let subtitle: String

    private let titleStyle = FontMapper.textStyle(family: .manrope, .extraBold, size: .f36, color: .white)
    private let subtitleStyle = FontMapper.textStyle(family: .spaceGrotesk, .medium, size: .f12, color: .primary, tracking: 3.2)

    var body: some View {
        VStack(spacing: 18) {
            Text(title.uppercased())
                .appFontStyle(titleStyle)
                .kerning(-3)

            Text(subtitle.uppercased())
                .appFontStyle(subtitleStyle)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 28)
        .padding(.bottom, 120)
    }
}
