//
//  Logo+Heading.swift
//  Raze
//
//  Created by KAKAROT on 3/23/26.
//

import Foundation
import SwiftUI

struct LogoHeading : View {
    var body: some View {
        
        VStack{
            AppImages.appLogo
                .resizable()
                .scaledToFill()
                .frame(width : 40 , height : 40)
            
            Text(AppStrings.appHeadline)
                
                
                
        }
    }
}
