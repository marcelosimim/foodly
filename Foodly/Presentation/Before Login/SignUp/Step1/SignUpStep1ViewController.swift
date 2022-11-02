//
//  SignUpStep1ViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import RxSwift
import UIKit

class SignUpStep1ViewController: UIViewController, Coordinating {
    private let customView = SignUpStep1View()
    private let viewmodel = AppContainer.shared.resolve(SignUpStep1ViewModel.self)!
    private let disposeBag = DisposeBag()
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        view = customView
        customView.setup()
        customView.inputTextField.textField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModelBinds()
    }

    private func setupButtons() {
        customView.inputTextField.clearButton.addTarget(self, action: #selector(clearPressed), for: .touchDown)
        customView.inputTextField.arrowButton.addTarget(self, action: #selector(arrowPressed), for: .touchDown)
    }

    @objc private func clearPressed() {
        customView.inputTextField.textField.text = ""
        viewmodel.checkEmail("")
    }

    @objc private func arrowPressed() {
        viewmodel.saveEmail()
        coodinator?.eventOccurred(with: .signUpStep1Tapped)
    }

    private func viewModelBinds() {
        let arrowButton = customView.inputTextField.arrowButton

        viewmodel.isEmailValid.bind { isValid in
            arrowButton.isEnabled = isValid
        }.disposed(by: disposeBag)
    }
}

extension SignUpStep1ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewmodel.checkEmail(textField.text ?? "")
        textField.resignFirstResponder()
        return true
    }
}
