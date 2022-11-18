//
//  SearchDetailsCell.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/18/22.
//

import UIKit

class SearchDetailsCell: UITableViewCell {
    static let identifier = "\(SearchDetailsCell.self)"
    private let photo = UIImageView()
    private let nameLabel = UILabel()
    private let addressLabel = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        setupLayer()
        addViews()
    }

    private func addViews() {
        addSubviews([photo, nameLabel, addressLabel])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.centerXAnchor.constraint(equalTo: centerXAnchor),
            photo.heightAnchor.constraint(equalToConstant: 134),

            nameLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            addressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            addressLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            addressLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }

    private func setupLayer() {
        photo.layer.cornerRadius = 16
        photo.layer.masksToBounds = true
    }

    private func chooseImage(_ type: CategoryType) {
        switch type {
        case .chicken:
            photo.image = UIImage(named: "chicken\(Int.random(in: 0...4))")
        case .chinese:
            photo.image = UIImage(named: "chinese\(Int.random(in: 0...4))")
        case .fish:
            photo.image = UIImage(named: "fish\(Int.random(in: 0...4))")
        case .hamburguer:
            photo.image = UIImage(named: "hamburguer\(Int.random(in: 0...4))")
        case .hotdog:
            photo.image = UIImage(named: "hotdog\(Int.random(in: 0...4))")
        case .italian:
            photo.image = UIImage(named: "italian\(Int.random(in: 0...4))")
        case .japanese:
            photo.image = UIImage(named: "japanese\(Int.random(in: 0...4))")
        case .meat:
            photo.image = UIImage(named: "meat\(Int.random(in: 0...4))")
        case .mexican:
            photo.image = UIImage(named: "mexican\(Int.random(in: 0...4))")
        case .pizza:
            photo.image = UIImage(named: "pizza\(Int.random(in: 0...4))")
        case .restaurant:
            photo.image = UIImage(named: "restaurant\(Int.random(in: 0...4))")
        }
    }

    func configure(type: CategoryType, restaurant: Restaurant) {
        nameLabel.text = restaurant.poi?.name ?? "No name"
        addressLabel.text = restaurant.address?.freeformAddress
        chooseImage(type)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        contentView.backgroundColor = .white
    }
}

extension SearchDetailsCell: Stylable {
    func setupImages() {
        photo.contentMode = .scaleToFill
        photo.backgroundColor = .red
    }

    func setupFonts() {
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        addressLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
}
