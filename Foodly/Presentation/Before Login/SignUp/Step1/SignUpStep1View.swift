//
//  SignUpStep1View.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class SignUpStep1View: UIView {
    private let backgroundImage = UIImageView()
    private let emailLabel = UILabel()
    let userPhoto = UserPhoto()
    let inputTextField = InputTextField()

    func setup() {
        setupStyles()
        addViews()
        inputTextField.setup(type: .name)
        userPhoto.setup(type: .interactive)
    }

    private func addViews() {
        addSubviews([userPhoto, backgroundImage, emailLabel, inputTextField])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            userPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            userPhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
            userPhoto.widthAnchor.constraint(equalToConstant: 250),
            userPhoto.heightAnchor.constraint(equalToConstant: 250),

            emailLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            inputTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24),
            inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: 61),

            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 60),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
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
        emailLabel.text = "What's your name?"
    }

    func setupFonts() {
        emailLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
}

