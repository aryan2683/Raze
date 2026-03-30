//
//  AppTextField.swift
//  Raze
//
//  Created by KAKAROT on 3/30/26.
//

import Foundation
import SwiftUI
import UIKit

struct AppTextField : View {
    var placeholder : String?
    @Binding var text : String
    var isSecure : Bool = false
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType?
    var autocapitalization: TextInputAutocapitalization = .never
    var disableAutocorrection: Bool = true
    
    var body : some View {
        if isSecure{
            SecureField(
                "",
                text: $text,
                prompt: Text(placeholder ?? "Enter data in field")
                    .foregroundColor(Color.gray.opacity(0.9))
            )
                .textInputAutocapitalization(autocapitalization)
                .autocorrectionDisabled(disableAutocorrection)
                .textContentType(textContentType)
                .keyboardType(keyboardType)
                .padding(10)
                .foregroundColor(AppColor.white.color)
                .frame(maxWidth: .infinity, minHeight: 28, alignment: .leading)
                .background(AppColor.secondary.color)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.white.opacity(0.6), lineWidth: 1)
                )
               
        }
        else{
            TextField(
                "",
                text: $text,
                prompt: Text(placeholder ?? "Enter data in field")
                    .foregroundColor(Color.gray.opacity(0.9))
            )
                .textInputAutocapitalization(autocapitalization)
                .autocorrectionDisabled(disableAutocorrection)
                .textContentType(textContentType)
                .keyboardType(keyboardType)
                .padding(10)
                .foregroundColor(AppColor.white.color)
                .frame(maxWidth: .infinity, minHeight: 28, alignment: .leading)
                .background(AppColor.secondary.color)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.white.opacity(0.6), lineWidth: 1)
                )
        }
    }
    
}
