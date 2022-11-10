//
//  SearchBar.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import UIKit

class SearchBar: UIView {
    private let searchIcon = UIImageView()
    let clearButton = UIButton()
    let textField = UITextField()

    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        setupStyles()
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
    }

    private func addViews() {
        addSubviews([searchIcon, textField, clearButton])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchIcon.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchIcon.widthAnchor.constraint(equalToConstant: 18),

            textField.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: clearButton.leadingAnchor, constant: -20),

            clearButton.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            clearButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            clearButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            clearButton.widthAnchor.constraint(equalToConstant: 22),
        ])
    }
}

extension SearchBar: Stylable {
    func setupColors() {
        backgroundColor = .whiteCultured
        textField.textColor = .black
        searchIcon.tintColor = .black
        clearButton.tintColor = .lightGray.withAlphaComponent(0.2)
    }

    func setupImages() {
        searchIcon.image = .search
        searchIcon.contentMode = .scaleAspectFit
        clearButton.setImage(.xmarkCircle, for: .normal)
        clearButton.contentMode = .scaleAspectFit
    }
}
