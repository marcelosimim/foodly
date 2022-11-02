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
    func checkEmail(_ email: String)
}

class DefaultSignUpStep1ViewModel: SignUpStep1ViewModel {
    let disposeBag = DisposeBag()
    var email = ""
    var isEmailValid = PublishSubject<Bool>()

    func checkEmail(_ email: String) {
        isEmailValid.onNext(email.isValidEmail())
    }

    func saveEmail() {
        UserDefaults.standard.set(email, forKey: "email")
    }
}
