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
        iconView.contentMode = .scaleAspectFit
    }

    private func addViews() {
        addSubviews([iconView])
        guard let titleLabel = titleLabel else { return }
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }

}

extension RedButton: Stylable {
    func setupColors() {
        backgroundColor = .mainRed
        iconView.tintColor = .white
    }

    func setupFonts() {
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
