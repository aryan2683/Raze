//
//  SplashView.swift
//  Raze
//
//  Created by KAKAROT on 3/23/26.
//

import Foundation
import SwiftUI

struct SplashView: View {

    var body: some View {
        ZStack {
            AppImages.splashScreenImage
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()


            SplashHeroCopyView(
                title: AppStrings.splashTitle,
                subtitle: AppStrings.splashSubtitle
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .safeAreaInset(edge: .top, spacing: 0) {
            SplashHeaderView(
                title: AppStrings.appName,
                actionTitle: AppStrings.kSkip,
                onTapSkip: { }
            )
        }
    }
}
