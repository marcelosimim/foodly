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

    func checkPassword(_ text: String)
}

class DefaultSignUpStep2ViewModel: SignUpStep2ViewModel {
    var userPassword = ""
    var isPasswordValid = PublishSubject<Bool>()

    func checkPassword(_ text: String) {
        let isValid = text.isValidPassword()

        userPassword = isValid ? text : ""
        isPasswordValid.onNext(isValid)
    }
}
