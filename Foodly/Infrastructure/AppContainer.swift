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
        container.register(UserRepository.self) { _ in DefaultUserRepository() }
        // MARK: - UseCases
        container.register(AuthUseCase.self) { r in DefaultAuthUseCase(authRepository: r.resolve(AuthRepository.self)!) }
        container.register(UserUseCase.self) { r in DefaultUserUseCase(userRepository: r.resolve(UserRepository.self)!) }
        // MARK: - ViewModels
        container.register(SignUpStep1ViewModel.self) { _ in DefaultSignUpStep1ViewModel()}
        container.register(SignUpStep2ViewModel.self) { _ in DefaultSignUpStep2ViewModel()}
        container.register(SignUpStep3ViewModel.self) { r in DefaultSignUpStep3ViewModel(authUseCase: r.resolve(AuthUseCase.self)!, userUseCase: r.resolve(UserUseCase.self)!)}
        container.register(PerfilViewModel.self) { _ in DefaultPerfilViewModel() }
        return container
    }()
}
