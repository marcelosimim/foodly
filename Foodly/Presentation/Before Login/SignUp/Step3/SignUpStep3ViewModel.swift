//
//  SignUpStep3ViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation
import RxCocoa
import RxSwift

protocol SignUpStep3ViewModel {
    var isPasswordValid: PublishSubject<Bool> { get }
    var signUpHasFinished: PublishSubject<Error?> { get }

    func checkPassword(_ text: String)
    func signUp()
}

class DefaultSignUpStep3ViewModel: SignUpStep3ViewModel {
    private let authUseCase: AuthUseCase
    private let userUseCase: UserUseCase
    var user = User()
    var userPassword: String? 
    var isPasswordValid = PublishSubject<Bool>()
    var signUpHasFinished = PublishSubject<Error?>()

    init(authUseCase: AuthUseCase, userUseCase: UserUseCase) {
        self.authUseCase = authUseCase
        self.userUseCase = userUseCase
        getInfos()
    }

    func checkPassword(_ text: String) {
        let isValid = text.isValidPassword()

        userPassword = isValid ? text : ""
        isPasswordValid.onNext(isValid)
    }

    func signUp() {
        guard let userEmail = user.email, let userPassword = userPassword else { return }
        authUseCase.signUp(email: userEmail, password: userPassword) { [weak self] error in
            self?.addNewUser()
        }
    }

    private func addNewUser() {
        let newUser = User(name: user.name, email: user.email, photo: user.photo)
        userUseCase.saveNewUser(user: newUser.toModel()) { [weak self] error in
            self?.signUpHasFinished.onNext(error)
        }
    }

    private func getInfos() {
        user.name = UserDefaults.standard.string(forKey: "name")
        user.email = UserDefaults.standard.string(forKey: "email")
        user.photo = UserDefaults.standard.data(forKey: "photo")
    }
}
