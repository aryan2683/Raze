//
//  LoginViewModel.swift
//  Raze
//
//  Created by KAKAROT on 3/29/26.
//

import Foundation
import SwiftUI
internal import Combine


class AuthViewModel : ObservableObject{
    
   @Published var authDataModel : AuthDataModel
    
   var trailingHeadingText : String{
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

    
    var authType : UserAuthStep
    
    init(authDataModel: AuthDataModel , authType : UserAuthStep) {
        self.authDataModel = authDataModel
        self.authType = authType
    }
    
    
}
