//
//  SignUpStep1ViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation
import RxSwift

protocol SignUpStep1ViewModel {
    var isNameValid: PublishSubject<Bool> { get }

    func saveName()
    func savePhoto(_ data: Data)
    func checkName(_ text: String)
}

class DefaultSignUpStep1ViewModel: SignUpStep1ViewModel {
    var userName = ""
    var isNameValid = PublishSubject<Bool>()

    func checkName(_ text: String) {
        let isValid = text != ""

        userName = text
        isNameValid.onNext(isValid)
    }

    func saveName() {
        UserDefaults.standard.set(userName, forKey: "name")
    }

    func savePhoto(_ data: Data) {
        UserDefaults.standard.set(data, forKey: "photo")
    }
}
