//
//  InputTextField.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

class InputTextField: UITextField {
    let clearButton = UIButton()
    let arrowButton = UIButton()
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
        layer.borderWidth = 1
        layer.cornerRadius = 10
    }

    private func addViews() {
        addSubviews([clearButton, arrowButton])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            clearButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            clearButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -84),

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
        placeholder = "youremailaddress.com"
    }

    func setupImages() {
        clearButton.setImage(.xmarkCircle, for: .normal)
        arrowButton.setImage(.rightArrowNative, for: .normal)
        arrowButton.layer.cornerRadius = 8
    }
}

extension InputTextField {
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
