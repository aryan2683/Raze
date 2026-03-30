//
//  AuthHeading.swift
//  Raze
//
//  Created by KAKAROT on 3/30/26.
//

import Foundation
import SwiftUI
struct AuthHeading : View{
    
    var heading : String = ""
    var trailingHeading : String = ""
    var subheading : String = ""
    
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
    private let subheadingStyle = FontMapper.textStyle(
        family: .spaceGrotesk,
        .regular,
        size: .f14,
        color: .white
    )

    
    var body : some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(heading)
                .appTextStyle(leadingHeadingStyle)

            Text(trailingHeading)
                .appTextStyle(trailingHeadingStyle)
                .italic()

            Text(subheading)
                .appTextStyle(subheadingStyle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .opacity(0.72)
                .multilineTextAlignment(.leading)
        }
    }
}
