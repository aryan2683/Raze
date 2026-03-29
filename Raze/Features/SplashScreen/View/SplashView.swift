//
//  SplashView.swift
//  Raze
//
//  Created by KAKAROT on 3/23/26.
//

import Foundation
import SwiftUI

struct SplashView: View {
    @ObservedObject var coordinator: AppCoordinator
    private let shouldAutoNavigate: Bool

    @State private var hasScheduledNavigation = false

    init(
        coordinator: AppCoordinator,
        shouldAutoNavigate: Bool = true
    ) {
        self.coordinator = coordinator
        self.shouldAutoNavigate = shouldAutoNavigate
    }

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
            NavHeaderView(
                title: AppStrings.appName,
                actionTitle: AppStrings.kSkip,
                onTapSkip: {
                    coordinator.authFlow(.logIn)
                }
            )
        }
        .task {
            guard shouldAutoNavigate else { return }
            guard hasScheduledNavigation == false else { return }
            hasScheduledNavigation = true

            try? await Task.sleep(for: .seconds(2))
            coordinator.authFlow(.logIn)
        }
    }
}

#Preview {
    NavigationStack {
        SplashView(
            coordinator: AppCoordinator(),
            shouldAutoNavigate: false
        )
    }
}
