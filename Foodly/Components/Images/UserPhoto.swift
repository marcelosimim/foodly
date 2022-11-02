//
//  UserPhoto.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

enum UserPhotoType {
    case interactive
    case notInteractive
}

class UserPhoto: UIView {
    private let imageView = UIImageView()
    private let addPhotoLabel = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        setupStyles()
    }

    func setup(type: UserPhotoType){
        switch type {
        case .interactive:
            setupInteractive()
        case .notInteractive:
            setupNotInteractive()
        }
    }

    func changeImage(_ data: Data) {
        imageView.image = UIImage(data: data)
        addPhotoLabel.isHidden = true
    }

    private func setupInteractive() {
        isUserInteractionEnabled = true
    }

    private func setupNotInteractive() {
        addPhotoLabel.isHidden = true
    }

    private func addViews() {
        addSubviews([imageView, addPhotoLabel])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            addPhotoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            addPhotoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        setupLayer()
    }

    private func setupLayer() {
        layer.cornerRadius = 250/2
        clipsToBounds = true
    }
}

extension UserPhoto: Stylable {
    func setupColors() {
        backgroundColor = .mainRed
        addPhotoLabel.textColor = .white
    }

    func setupTexts() {
        addPhotoLabel.text = "Tap to add a photo"
    }

    func setupFonts() {
        addPhotoLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
}
