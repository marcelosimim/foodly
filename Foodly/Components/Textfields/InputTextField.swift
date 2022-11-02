//
//  InputTextField.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

enum InputTextFieldType {
    case email
    case password
}

class InputTextField: UIView {
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)
    let textField = UITextField()
    let clearButton = UIButton()
    let arrowButton = UIButton()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
        setupLayer()
    }

    // MARK: - type methods

    func setup(type: InputTextFieldType) {
        switch type {
        case .email:
            setupAsEmail()
        case .password:
            setupAsPassword()
        }
    }

    private func setupAsEmail() {
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
    }

    private func setupAsPassword() {
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
    }

    // MARK: - view methods

    private func setupLayer() {
        layer.borderWidth = 1
        layer.cornerRadius = 10
        arrowButton.isEnabled = false
    }

    private func addViews() {
        addSubviews([textField, clearButton, arrowButton])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            textField.trailingAnchor.constraint(equalTo: clearButton.leadingAnchor, constant: -10),

            clearButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            clearButton.trailingAnchor.constraint(equalTo: arrowButton.leadingAnchor, constant: -24),
            clearButton.widthAnchor.constraint(equalToConstant: 22),

            arrowButton.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            arrowButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            arrowButton.widthAnchor.constraint(equalToConstant: 56),
        ])
    }
}

extension InputTextField: Stylable {
    func setupColors() {
        layer.borderColor = UIColor.textFieldBorder.cgColor
        clearButton.tintColor = .lightGray.withAlphaComponent(0.2)
        arrowButton.backgroundColor = .red
        arrowButton.imageView?.tintColor = .white
    }

    func setupTexts() {
        textField.placeholder = "youremail@address.com"
    }

    func setupImages() {
        clearButton.setImage(.xmarkCircle, for: .normal)
        arrowButton.setImage(.rightArrowNative, for: .normal)
        arrowButton.layer.cornerRadius = 8
    }
}
