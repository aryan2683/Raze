//
//  LoginView.swift
//  Raze
//
//  Created by KAKAROT on 3/29/26.
//

import Foundation
import SwiftUI

struct AuthView: View {
    @StateObject var authViewModel: AuthViewModel

    private let leadingHeadingStyle = FontMapper.textStyle(
        family: .manrope,
        .extraBold,
        size: .f36,
        color: .white
    )

    private let trailingHeadingStyle = FontMapper.textStyle(
        family: .manrope,
        .extraBold,
        size: .f36,
        color: .primary
    )

    var body: some View {
        ZStack {
            VStack(alignment : .leading,spacing : 2){
                
                Text(authViewModel.headingText)
                    .appTextStyle(leadingHeadingStyle)
                
                 Text(authViewModel.trailingHeadingText)
                    .appTextStyle(trailingHeadingStyle)
                
                Text("Authorize biometric or credential acces ")
                    .appTextStyle(FontMapper.textStyle(family : .spaceGrotesk,.regular,size : .f14 , color : .nuetral))
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal,10)
            .padding(.vertical,10)
            .background(AppColor.tertiary)
        }
        .background(.black)
        .safeAreaInset(edge: .top, spacing: 0) {
            NavHeaderView(
                title: AppStrings.appName,
                actionTitle: "",
                onTapSkip: { }
            )
        }
    }
}

#Preview("Log In") {
    AuthView(authViewModel: .preview(authType: .logIn))
}

#Preview("Sign Up") {
    AuthView(authViewModel: .preview(authType: .signUp))
}

private extension AuthViewModel {
    static func preview(authType: UserAuthStep) -> AuthViewModel {
        AuthViewModel(
            authDataModel: AuthDataModel(),
            authType: authType
        )
    }
}
