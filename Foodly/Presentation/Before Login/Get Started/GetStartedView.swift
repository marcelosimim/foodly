//
//  GetStartedView.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

class GetStartedView: UIView {
    private let backgroundImage = UIImageView()
    private let mainLabel = UILabel()
    private let getStartedButton = RedButton()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([backgroundImage, mainLabel, getStartedButton])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 84),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            getStartedButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -59),
            getStartedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            getStartedButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            getStartedButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension GetStartedView: Stylable {
    func setupColors() {
        backgroundColor = .white
    }

    func setupImages() {
        backgroundImage.image = .getStarted
        backgroundImage.contentMode = .scaleAspectFill
        getStartedButton.setupRightIcon(icon: .rightArrow)
    }

    func setupFonts() {
        mainLabel.font = .systemFont(ofSize: 39, weight: .heavy)
        mainLabel.numberOfLines = 0
        mainLabel.adjustsFontSizeToFitWidth = true
    }

    func setupTexts() {
        mainLabel.text = "Get started with Foodly"
        getStartedButton.setupTitle(title: "Get Started")
    }
}
