import SwiftUI

struct SplashHeaderView: View {
    let title: String
    let actionTitle: String
    let onTapSkip: () -> Void

    private let titleStyle = FontMapper.textStyle(family: .manrope, .bold, size: .f18, color: .primary)
    private let actionStyle = FontMapper.textStyle(family: .manrope, .medium, size: .f12, color: .white, tracking: 1.6)

    var body: some View {
        HStack(alignment: .top) {
            Text(title.uppercased())
                .appFontStyle(titleStyle)

            Spacer()

            Button(action: onTapSkip) {
                Text(actionTitle.uppercased())
                    .appFontStyle(actionStyle)
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 26)
        .padding(.top, 10)
        .padding(.bottom, 6)
    }
}
