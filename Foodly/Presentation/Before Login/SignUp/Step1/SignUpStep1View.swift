//
//  SignUpStep1View.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class SignUpStep1View: UIView {
    private let backgroundImage = UIImageView()
    private let nameLabel = UILabel()
    let userPhoto = UserPhoto()
    let inputTextField = InputTextField()

    func setup() {
        setupStyles()
        addViews()
        inputTextField.setup(type: .name)
        userPhoto.setup(type: .interactive)
    }

    private func addViews() {
        addSubviews([userPhoto, backgroundImage, nameLabel, inputTextField])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            userPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            userPhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
            userPhoto.widthAnchor.constraint(equalToConstant: 250),
            userPhoto.heightAnchor.constraint(equalToConstant: 250),

            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            inputTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24),
            inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: 61),

            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 60),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        userPhoto.setupLayer(size: 250)
    }
}

extension SignUpStep1View: Stylable {
    func setupColors() {
        backgroundColor = .white
        nameLabel.textColor = .black
    }

    func setupImages() {
        backgroundImage.image = .signup1
    }

    func setupTexts() {
        nameLabel.text = "What's your name?"
    }

    func setupFonts() {
        nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
}

