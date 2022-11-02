//
//  SignUpStep1View.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

class SignUpStep1View: UIView {
    private let backgroundImage = UIImageView()
    private let emailLabel = UILabel()
    let inputTextField = InputTextField()

    func setup() {
        setupStyles()
        addViews()
        inputTextField.arrowButton.isEnabled = false
    }

    private func addViews() {
        addSubviews([backgroundImage, emailLabel, inputTextField])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),

            emailLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            inputTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24),
            inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: 61)
        ])
    }
}

extension SignUpStep1View: Stylable {
    func setupColors() {
        backgroundColor = .white
    }

    func setupImages() {
        backgroundImage.image = .signup1
    }

    func setupTexts() {
        emailLabel.text = "What's your email address?"
    }

    func setupFonts() {
        emailLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
}

