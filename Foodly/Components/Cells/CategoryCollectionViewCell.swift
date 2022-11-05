//
//  CategoryCollectionViewCell.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static var identifier = "\(CategoryCollectionViewCell.self)"
    private let categoryImage = UIImageView()
    private let categoryName = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        setupLayer()
        addViews()
        dropShadow(color: .black, opacity: 0.05, offSet: .zero, radius: 16)
    }

    func configure(_ image: UIImage, _ name: String) {
        self.categoryImage.image = image
        self.categoryName.text = name
    }

    private func addViews() {
        addSubviews([categoryImage, categoryName])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryName.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),

            categoryImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryImage.bottomAnchor.constraint(equalTo: categoryName.topAnchor, constant: -20),
            categoryImage.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

    private func setupLayer() {
        layer.cornerRadius = 16
    }
}

extension CategoryCollectionViewCell: Stylable {
    func setupColors() {
        backgroundColor = .white
    }
    
    func setupImages() {
        categoryImage.contentMode = .scaleAspectFit
    }

    func setupFonts() {
        categoryName.font = .systemFont(ofSize: 18, weight: .semibold)
        categoryName.adjustsFontSizeToFitWidth = true
    }
}
