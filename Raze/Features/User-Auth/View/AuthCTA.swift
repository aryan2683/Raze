//
//  AuthCTA.swift
//  Raze
//
//  Created by KAKAROT on 3/30/26.
//

import Foundation
import SwiftUI

struct AuthCTA : View{
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body : some View {
        VStack{
            
            AppButton(buttonTitle: "Initialise",
                      buttonImage: AppImages.boltIcon,
                      onTap: authViewModel. )
        }
        
    }
}
