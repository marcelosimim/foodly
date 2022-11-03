//
//  PerfilTableViewCell.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class PerfilTableViewCell: UITableViewCell {
    static let identifier = "\(PerfilTableViewCell.self)"
    private let stack = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    var type: PerfilTableViewCellType? 

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        stack.layer.cornerRadius = 16
        addSubviews([stack])
        stack.addSubviews([iconView, titleLabel])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),

            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38),
            iconView.heightAnchor.constraint(equalToConstant: 27),
            iconView.widthAnchor.constraint(equalToConstant: 27),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10)
        ])
    }

    func setup(icon: UIImage, title: String) {
        iconView.image = icon
        titleLabel.text = title
        selectionStyle = .none
    }

    func wasSelected() {
        switch type {
        case .favorites:
            stack.backgroundColor = .cellRedBackground
        case .payments:
            stack.backgroundColor = .cellBlueBackground
        case .help:
            stack.backgroundColor = .cellGreenBackground
        case .promotions:
            stack.backgroundColor = .cellPurpleBackground
        case .notifications:
            stack.backgroundColor = .cellYellowBackground
        case .deliveryWith:
            stack.backgroundColor = .cellDarkBlueBackground
        case .none:
            stack.backgroundColor = .white
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.stack.backgroundColor = .white
        }
    }
}

extension PerfilTableViewCell: Stylable {
    func setupImages() {
        iconView.contentMode = .scaleAspectFit
    }

    func setupColors() {
        backgroundColor = .clear
        titleLabel.textColor = .black
    }

    func setupFonts() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
}
