//
//  EnjoyCard.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/3/22.
//

import UIKit

class EnjoyCard: UIView {
    private let contentView = UIView()
    private let imageView = UIImageView()
    private let mainLabel = UILabel()
    private let secondLabel = UILabel()
    let seeDetailsButton = BlackButton()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    func setupLabels(main: String, second: String) {
        let underlineAttributedString = NSAttributedString(string: second, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue])
        mainLabel.text = main
        secondLabel.attributedText = underlineAttributedString
        mainLabel.numberOfLines = 0
        secondLabel.numberOfLines = 0
        mainLabel.textAlignment = .center
        secondLabel.textAlignment = .center
    }

    func setupImage(_ image: UIImage) {
        imageView.image = image
    }

    func setupColor(_ color: UIColor) {
        contentView.backgroundColor = color
    }

    private func addViews() {
        contentView.layer.cornerRadius = 15
        addSubviews([contentView, imageView])
        contentView.addSubviews([mainLabel, secondLabel, seeDetailsButton])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 105),

            mainLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            secondLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 14),
            secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            secondLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            seeDetailsButton.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 24),
            seeDetailsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            seeDetailsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            seeDetailsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            seeDetailsButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

extension EnjoyCard: Stylable {
    func setupImages() {
        imageView.contentMode = .scaleAspectFit
    }

    func setupTexts() {
        mainLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        secondLabel.font = .systemFont(ofSize: 12, weight: .medium)
        seeDetailsButton.setTitle("See details", for: .normal)
    }

    func setupColors() {
        mainLabel.textColor = .black
        secondLabel.textColor = .black
        backgroundColor = .clear
    }
}
