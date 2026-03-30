//
//  AppButton.swift
//  Raze
//
//  Created by KAKAROT on 3/30/26.
//

import Foundation
import SwiftUI

struct AppButton : View {
    
    var buttonTitle : String = ""
    var buttonImage : Image
    var onTap : () -> Void
    var body : some View {
        
        Button(action : {
            onTap()
        } , label : {
            
            HStack(alignment : .center,spacing : 8){
                Text(verbatim :buttonTitle.uppercased() )
                    .appTextStyle(FontMapper.textStyle(family: .manrope , .extraBold , size : .f16 , color : .nuetral))
                
                buttonImage
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width : 14 , height : 14)
                    .foregroundColor(AppColor.nuetral.color)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal,10)
            .padding(.vertical , 14)
            .background(
                Rectangle()
                    .fill(AppColor.primary.color)
            )
            .overlay(
                Rectangle()
                    .stroke(Color.white.opacity(0.6), lineWidth: 1)
            )
        }
        
        )
        .buttonStyle(.plain)
    }
}
