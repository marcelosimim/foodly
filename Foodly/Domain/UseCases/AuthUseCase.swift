//
//  AuthUseCase.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

protocol AuthUseCase {
    func signUp(email: String, password: String, completion: @escaping(Error?) -> Void)
}

class DefaultAuthUseCase: AuthUseCase {
    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func signUp(email: String, password: String, completion: @escaping(Error?) -> Void) {
        authRepository.signUp(email: email, password: password, completion: completion)
    }
}
