import SwiftUI

struct AppToolbar: ToolbarContent {
    struct Action {
        let title: String
        let style: FontMapper.TextStyle
        let icon: Image?
        let action: () -> Void

        init(
            title: String,
            style: FontMapper.TextStyle,
            icon: Image? = nil,
            action: @escaping () -> Void = {}
        ) {
            self.title = title
            self.style = style
            self.icon = icon
            self.action = action
        }
    }

    let title: String?
    let titleStyle: FontMapper.TextStyle
    let leadingAction: Action?
    let trailingAction: Action?

    init(
        title: String? = nil,
        titleStyle: FontMapper.TextStyle = FontMapper.textStyle(family: .manrope, .bold, size: .f20, color: .white),
        leadingAction: Action? = nil,
        trailingAction: Action? = nil
    ) {
        self.title = title
        self.titleStyle = titleStyle
        self.leadingAction = leadingAction
        self.trailingAction = trailingAction
    }

    var body: some ToolbarContent {
        if let leadingAction {
            ToolbarItem(placement: .navigationBarLeading) {
                toolbarButton(for: leadingAction)
            }
        }

        if let title {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .appFontStyle(titleStyle)
            }
        }

        if let trailingAction {
            ToolbarItem(placement: .navigationBarTrailing) {
                toolbarButton(for: trailingAction)
            }
        }
    }

    private func toolbarButton(for configuration: Action) -> some View {
        Button(action: configuration.action) {
            HStack(spacing: 6) {
                if let icon = configuration.icon {
                    icon
                        .renderingMode(.template)
                        .foregroundColor(configuration.style.color)
                }

                Text(configuration.title)
                    .appFontStyle(configuration.style)
            }
        }
        .buttonStyle(.plain)
    }
}
