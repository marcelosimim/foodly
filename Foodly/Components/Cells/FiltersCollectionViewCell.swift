//
//  FiltersCollectionViewCell.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/4/22.
//

import UIKit

class FiltersCollectionViewCell: UICollectionViewCell {
    static let identifier = "\(FiltersCollectionViewCell.self)"
    private let filterName = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        setupStyles()
        setupLayer()
    }

    func setup(_ name: String) {
        filterName.text = name
    }

    private func addViews() {
        addSubviews([filterName])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            filterName.centerXAnchor.constraint(equalTo: centerXAnchor),
            filterName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            filterName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    private func setupLayer() {
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.35).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
}

extension FiltersCollectionViewCell: Stylable {
    func setupColors() {
        filterName.textColor = .black
    }

    func setupFonts() {
        filterName.font = .systemFont(ofSize: 12, weight: .regular)
    }
}
