//
//  LoginViewModel.swift
//  Raze
//
//  Created by KAKAROT on 3/29/26.
//

import Foundation
import SwiftUI
import UIKit
internal import Combine

final class AuthViewModel: ObservableObject {
    enum AuthField: String, Identifiable {
        case fullName
        case emailAddress
        case deploymentID
        case accessKey

        var id: String { rawValue }
    }

    struct FieldConfiguration: Identifiable {
        let field: AuthField
        let heading: String
        let placeholder: String
        let isSecure: Bool
        let keyboardType: UIKeyboardType
        let textContentType: UITextContentType?
        let autocapitalization: TextInputAutocapitalization
        let disableAutocorrection: Bool

        var id: AuthField { field }
    }

    @Published var authDataModel: AuthDataModel

    var errorMessage : String?
    
    var trailingHeadingText: String {
        switch authType {
        case .logIn:
            "Centre"
        case .signUp:
            "Profile"
        }
    }

    var headingText: String {
        switch authType {
        case .logIn:
            "Command"
        case .signUp:
            "Create"
        }
    }

    var subheading: String {
        switch authType {
        case .logIn:
            "Authorize biometric or credential access"
        case .signUp:
            "Establish your performance credentials"
        }
    }

    var fieldConfigurations: [FieldConfiguration] {
        switch authType {
        case .logIn:
            [
                FieldConfiguration(
                    field: .deploymentID,
                    heading: "Deployment ID",
                    placeholder: "EMAIL_ADDRESS",
                    isSecure: false,
                    keyboardType: .emailAddress,
                    textContentType: .username,
                    autocapitalization: .never,
                    disableAutocorrection: true
                ),
                FieldConfiguration(
                    field: .accessKey,
                    heading: "Access Key",
                    placeholder: "••••••••",
                    isSecure: true,
                    keyboardType: .default,
                    textContentType: .password,
                    autocapitalization: .never,
                    disableAutocorrection: true
                )
            ]
        case .signUp:
            [
                FieldConfiguration(
                    field: .fullName,
                    heading: "Full Name",
                    placeholder: "ENTER NAME",
                    isSecure: false,
                    keyboardType: .default,
                    textContentType: .name,
                    autocapitalization: .words,
                    disableAutocorrection: true
                ),
                FieldConfiguration(
                    field: .emailAddress,
                    heading: "Email Address",
                    placeholder: "USER@NETWORK.RAZE",
                    isSecure: false,
                    keyboardType: .emailAddress,
                    textContentType: .emailAddress,
                    autocapitalization: .never,
                    disableAutocorrection: true
                ),
                FieldConfiguration(
                    field: .accessKey,
                    heading: "Access Key",
                    placeholder: "••••••••",
                    isSecure: true,
                    keyboardType: .default,
                    textContentType: .newPassword,
                    autocapitalization: .never,
                    disableAutocorrection: true
                )
            ]
        }
    }

    let authType: UserAuthStep

    init(authDataModel: AuthDataModel, authType: UserAuthStep) {
        self.authDataModel = authDataModel
        self.authType = authType
    }

    func binding(for field: AuthField) -> Binding<String> {
        Binding(
            get: { [weak self] in
                guard let self else { return "" }

                switch field {
                case .fullName:
                    return authDataModel.fullName
                case .emailAddress:
                    return authDataModel.emailAddress
                case .deploymentID:
                    return authDataModel.deploymentID
                case .accessKey:
                    return authDataModel.accessKey
                }
            },
            set: { [weak self] newValue in
                guard let self else { return }

                switch field {
                case .fullName:
                    authDataModel.fullName = newValue
                case .emailAddress:
                    authDataModel.emailAddress = newValue
                case .deploymentID:
                    authDataModel.deploymentID = newValue
                case .accessKey:
                    authDataModel.accessKey = newValue
                }
            }
        )
    }
    
    func checkEmailRegex(userName : String , password : String){
        
        guard !userName.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.isEmpty else {
            errorMessage = "Please enter both username and password."
            return
        }
        
    }
}
