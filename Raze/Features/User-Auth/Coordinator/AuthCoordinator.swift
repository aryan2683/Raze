//
//  AuthCoordinator.swift
//  Raze
//
//  Created by KAKAROT on 3/29/26.
//

import Foundation
import SwiftUI
internal import Combine

enum AppRoute: Hashable {
    case auth(UserAuthStep)
}

@MainActor
final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func authFlow(_ authType: UserAuthStep = .logIn) {
        path.append(AppRoute.auth(authType))
    }

    @ViewBuilder
    func build(_ route: AppRoute) -> some View {
        switch route {
        case .auth(let authType):
            AuthView(authViewModel: self.makeAuthViewModel(authType: authType))
        }
    }

    private func makeAuthViewModel(authType: UserAuthStep) -> AuthViewModel {
        let authDataModel = AuthDataModel()
        return AuthViewModel(authDataModel: authDataModel, authType: authType)
    }
}
