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
 
    var body: some View {
        ZStack {
            VStack(alignment: .leading,spacing : 16) {
                AuthHeading(heading: authViewModel.headingText ,
                            trailingHeading: authViewModel.trailingHeadingText ,
                            subheading: authViewModel.subheading
                )

                AuthForm()
            }
            .padding(.horizontal,20)
            .padding(.vertical,24)
            .background(AppColor.nuetral)
            .environmentObject(authViewModel)
        }
        .background(.black)
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .padding(.horizontal,20)
        .padding(.vertical,24)
        .toolbar(.hidden , for : .navigationBar)
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
