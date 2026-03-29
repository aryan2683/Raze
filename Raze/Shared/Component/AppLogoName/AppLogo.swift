//
//  AppLogo.swift
//  Raze
//
//  Created by KAKAROT on 3/29/26.
//

import Foundation
import SwiftUI

struct AppLogo: View {
    private let brandStyle = FontMapper.textStyle(family: .manrope, .bold, size: .f36, color: .primary)

    var body: some View {
        Text(AppStrings.appName)
            .appFontStyle(brandStyle)
    }
}
