//
//  EnjoyCardDetails.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/3/22.
//

import UIKit

class EnjoyCardDetails: UIView {
    private let imageView = UIImageView()
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    private let thirdLabel = UILabel()
    private let happyFoodlyButton = RedButton()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([imageView, firstLabel, secondLabel, thirdLabel, happyFoodlyButton])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),

            firstLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 14),
            firstLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 14),
            secondLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 14),
            thirdLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            thirdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 85),

            happyFoodlyButton.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 32),
            happyFoodlyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            happyFoodlyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 58),
            //happyFoodlyButton.bottomAnchor.constraint(equalTo: bottomAnchor)
            happyFoodlyButton.heightAnchor.constraint(equalToConstant: 60),
        ])

    }
}

extension EnjoyCardDetails: Stylable {
    func setupColors() {
        firstLabel.textColor = .systemGreen
        secondLabel.textColor = .black
        thirdLabel.textColor = .black
        backgroundColor  = .white
//        happyFoodlyButton.backgroundColor = .mainRed
//        happyFoodlyButton.setTitleColor(.white, for: .normal)
    }

    func setupImages() {
        imageView.image = .enjoyDetails
        imageView.layer.cornerRadius = 20
        happyFoodlyButton.setupRightIcon(icon: .defaultCheckmark)
    }

    func setupTexts() {
        firstLabel.text = "Your first 2 orders"
        secondLabel.text = "Enjoy 25% off ( up to us $7)"
        thirdLabel.text = "Welcome to Foodly! Here's a little something for you first order"
        thirdLabel.numberOfLines = 0
        happyFoodlyButton.setupTitle(title: "Happy Foodly")
        // happyFoodlyButton.setupRightIcon(icon: .checkmark)
    }

    func setupFonts() {
        firstLabel.font = .systemFont(ofSize: 16, weight: .bold)
        secondLabel.font = .systemFont(ofSize: 23, weight: .bold)
        thirdLabel.font = .systemFont(ofSize: 14, weight: .regular)
        // happyFoodlyButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
}
