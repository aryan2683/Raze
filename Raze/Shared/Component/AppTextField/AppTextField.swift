//
//  AppTextField.swift
//  Raze
//
//  Created by KAKAROT on 3/30/26.
//

import Foundation
import SwiftUI

struct AppTextField : View {
    var placeholder : String?
    @Binding var text : String
    var isSecure : Bool = false
    
    var body : some View {
        if isSecure{
            SecureField(placeholder ?? "Enter data in field" , text: $text)
                .padding(10)
                .foregroundStyle(AppColor.white)
                .backgroundStyle(AppColor.secondary)
                .border(.white)
               
        }
        else{
            TextField(placeholder ?? "Enter data in field" , text: $text)
                .padding(10)
                .foregroundStyle(AppColor.white)
                .backgroundStyle(AppColor.secondary)
                .border(.white)
        }
    }
    
}
