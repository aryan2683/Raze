//
//  RazeApp.swift
//  Raze
//
//  Created by KAKAROT on 3/23/26.
//

import SwiftUI

@main
struct RazeApp: App {
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                SplashView(coordinator: coordinator)
                    .navigationDestination(for: AppRoute.self) { route in
                        coordinator.build(route)
                    }
            }
        }
    }
}
