//
//  SignUpStep3View.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class SignUpStep3View: UIView {
    private let backgroundImage = UIImageView()
    private let passwordLabel = UILabel()
    let inputTextField = InputTextField()

    func setup() {
        setupStyles()
        addViews()
        inputTextField.setup(type: .password)
    }

    private func addViews() {
        addSubviews([backgroundImage, passwordLabel, inputTextField])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),

            passwordLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            inputTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 24),
            inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: 61)
        ])
    }
}

extension SignUpStep3View: Stylable {
    func setupColors() {
        backgroundColor = .white
    }

    func setupImages() {
        backgroundImage.image = .signup3
    }

    func setupTexts() {
        passwordLabel.text = "Create your account password"
    }

    func setupFonts() {
        passwordLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
}

