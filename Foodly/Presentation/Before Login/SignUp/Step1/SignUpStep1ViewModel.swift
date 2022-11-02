//
//  SignUpStep1ViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import Foundation
import RxCocoa
import RxSwift

protocol SignUpStep1ViewModel {
    var isEmailValid: PublishSubject<Bool> { get }

    func saveEmail()
    func checkEmail(_ text: String)
}

class DefaultSignUpStep1ViewModel: SignUpStep1ViewModel {
    var userEmail = ""
    var isEmailValid = PublishSubject<Bool>()

    func checkEmail(_ text: String) {
        let isValid = text.isValidEmail()

        userEmail = isValid ? text : ""
        isEmailValid.onNext(isValid)
    }

    func saveEmail() {
        UserDefaults.standard.set(userEmail, forKey: "email")
    }
}
