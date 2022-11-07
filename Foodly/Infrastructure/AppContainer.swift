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
        container.register(SearchRepository.self) { _ in DefaultSearchRepository() }
        // MARK: - UseCases
        container.register(AuthUseCase.self) { r in DefaultAuthUseCase(authRepository: r.resolve(AuthRepository.self)!) }
        container.register(UserUseCase.self) { r in DefaultUserUseCase(userRepository: r.resolve(UserRepository.self)!) }
        container.register(SearchUseCase.self) { r in DefaultSearchUseCase(searchRepository: r.resolve(SearchRepository.self)!) }
        // MARK: - ViewModels
        container.register(SignUpStep1ViewModel.self) { _ in DefaultSignUpStep1ViewModel()}
        container.register(SignUpStep2ViewModel.self) { _ in DefaultSignUpStep2ViewModel()}
        container.register(SignUpStep3ViewModel.self) { r in DefaultSignUpStep3ViewModel(authUseCase: r.resolve(AuthUseCase.self)!, userUseCase: r.resolve(UserUseCase.self)!)}
        container.register(PerfilViewModel.self) { r in DefaultPerfilViewModel(userUseCase: r.resolve(UserUseCase.self)! ) }
        container.register(HomeViewModel.self) { _ in DefaultHomeViewModel() }
        container.register(SearchViewModel.self) { r in DefaultSearchViewModel(searchUseCase: r.resolve(SearchUseCase.self)! ) }
        return container
    }()
}
