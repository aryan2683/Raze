//
//  AuthTextFields.swift
//  Raze
//
//  Created by KAKAROT on 3/30/26.
//

import Foundation
import SwiftUI

struct AuthForm: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(authViewModel.fieldConfigurations) { configuration in
                AuthTextFields(
                    text: authViewModel.binding(for: configuration.field),
                    fieldHeading: configuration.heading,
                    placeholder: configuration.placeholder,
                    isSecure: configuration.isSecure
                )
            }
        }
    }
}

struct AuthTextFields: View {
    @Binding var text: String
    var fieldHeading: String = ""
    var placeholder: String = ""
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(fieldHeading.uppercased())
                .appTextStyle(
                    FontMapper.textStyle(
                        family: .spaceGrotesk,
                        .regular,
                        size: .f12,
                        color: .primary
                    )
                )

            AppTextField(
                placeholder: placeholder,
                text: $text,
                isSecure: isSecure
            )
        }
    }
}
