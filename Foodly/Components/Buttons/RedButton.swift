//
//  RedButton.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

class RedButton: UIButton {
    private let iconView = UIImageView()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
        layer.cornerRadius = 10
    }

    func setupTitle(title: String) {
        setTitle(title, for: .normal)
    }

    func setupRightIcon(icon: UIImage) {
        iconView.image = icon
    }

    private func addViews() {
        addSubviews([iconView])
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }

}

extension RedButton: Stylable {
    func setupColors() {
        backgroundColor = .mainRed
    }

    func setupFonts() {
        titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
}
