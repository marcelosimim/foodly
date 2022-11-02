//
//  AppContainer.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import Foundation
import Swinject

class AppContainer {
    static let shared: Container = {
        let container = Container()
        // MARK: - Repositories
        container.register(AuthRepository.self) { _ in DefaultAuthRepository() }
        // MARK: - UseCases
        container.register(AuthUseCase.self) { r in DefaultAuthUseCase(authRepository: r.resolve(AuthRepository.self)!) }
        // MARK: - ViewModels
        container.register(SignUpStep1ViewModel.self) { _ in DefaultSignUpStep1ViewModel()}
        container.register(SignUpStep2ViewModel.self) { r in DefaultSignUpStep2ViewModel(authUseCase: r.resolve(AuthUseCase.self)!)}
        return container
    }()
}
