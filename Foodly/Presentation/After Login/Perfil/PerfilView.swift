//
//  PerfilView.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class PerfilView: UIView {
    let userPhoto = UserPhoto()
    let nameLabel = UILabel()
    let viewAccountButton = UIButton()
    private lazy var userInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, viewAccountButton])
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        return stack
    }()
    private let covidBanner = UIImageView()
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(PerfilTableViewCell.self, forCellReuseIdentifier: PerfilTableViewCell.identifier)
        tableview.separatorStyle = .none
        return tableview
    }()
    let blackButton = BlackButton()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
        userPhoto.setup(type: .notInteractive)
    }

    private func addViews() {
        addSubviews([userPhoto, userInfoStack, covidBanner, tableView, blackButton])
        userInfoStack.addSubview(nameLabel)
        userInfoStack.addSubview(viewAccountButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 84),
            userPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            userPhoto.heightAnchor.constraint(equalToConstant: 70),
            userPhoto.widthAnchor.constraint(equalToConstant: 70),

            userInfoStack.centerYAnchor.constraint(equalTo: userPhoto.centerYAnchor),
            userInfoStack.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 18),

            covidBanner.topAnchor.constraint(equalTo: userPhoto.bottomAnchor, constant: 22),
            covidBanner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            covidBanner.centerXAnchor.constraint(equalTo: centerXAnchor),
            covidBanner.heightAnchor.constraint(equalToConstant: 100),

            tableView.topAnchor.constraint(equalTo: covidBanner.bottomAnchor, constant: 44),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: blackButton.topAnchor, constant: -10),

            blackButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            blackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            blackButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            blackButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        userPhoto.setupLayer(size: 70)
    }
}

extension PerfilView: Stylable {
    func setupColors() {
        backgroundColor = .white
        nameLabel.textColor = .black
        viewAccountButton.setTitleColor(.systemGreen, for: .normal)
    }

    func setupTexts() {
        viewAccountButton.setTitle("View Account", for: .normal)
        blackButton.setup(title: "View Basket")
    }

    func setupFonts() {
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        viewAccountButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
    }

    func setupImages() {
        covidBanner.image = .covidBanner
        covidBanner.contentMode = .scaleAspectFit
    }
}
