//
//  SignUpStep2ViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation
import RxCocoa
import RxSwift

protocol SignUpStep2ViewModel {
    var isPasswordValid: PublishSubject<Bool> { get }
    var signUpHasFinished: PublishSubject<Error?> { get }

    func checkPassword(_ text: String)
    func signUp()
}

class DefaultSignUpStep2ViewModel: SignUpStep2ViewModel {
    private let authUseCase: AuthUseCase
    var userEmail: String?
    var userPassword: String?
    var isPasswordValid = PublishSubject<Bool>()
    var signUpHasFinished = PublishSubject<Error?>()

    init(authUseCase: AuthUseCase) {
        self.authUseCase = authUseCase
        getEmail()
    }

    func checkPassword(_ text: String) {
        let isValid = text.isValidPassword()

        userPassword = isValid ? text : ""
        isPasswordValid.onNext(isValid)
    }

    func signUp() {
        guard let userEmail = userEmail, let userPassword = userPassword else { return }
        authUseCase.signUp(email: userEmail, password: userPassword) { [weak self] error in
            self?.signUpHasFinished.onNext(error)
        }
    }

    private func getEmail() {
        userEmail = UserDefaults.standard.string(forKey: "email")
    }
}
