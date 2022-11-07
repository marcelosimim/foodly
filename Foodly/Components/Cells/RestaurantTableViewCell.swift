//
//  RestaurantTableViewCell.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import CoreLocation
import UIKit

class RestaurantTableViewCell: UITableViewCell {
    static let identifier = "\(RestaurantTableViewCell.self)"
    private let photo = UIImageView()
    private let nameLabel = UILabel()
    private let distanceView = UIView()
    private let distanceLabel = UILabel()
    private let scoreView = UIView()
    private let scoreLabel = UILabel()
    private let starIcon = UIImageView()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        setupLayer()
        addViews()
    }

    private func addViews() {
        addSubviews([photo, nameLabel, distanceView, scoreView])
        distanceView.addSubviews([distanceLabel])
        scoreView.addSubviews([scoreLabel, starIcon])
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

            distanceView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            distanceView.leadingAnchor.constraint(equalTo: photo.leadingAnchor),
            distanceView.heightAnchor.constraint(equalToConstant: 40),

            distanceLabel.leadingAnchor.constraint(equalTo: distanceView.leadingAnchor, constant: 16),
            distanceLabel.centerXAnchor.constraint(equalTo: distanceView.centerXAnchor),
            distanceLabel.centerYAnchor.constraint(equalTo: distanceView.centerYAnchor),

            scoreView.topAnchor.constraint(equalTo: distanceView.topAnchor),
            scoreView.leadingAnchor.constraint(equalTo: distanceView.trailingAnchor, constant: 12),
            scoreView.heightAnchor.constraint(equalToConstant: 40),

            scoreLabel.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor, constant: 16),
            scoreLabel.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),

            starIcon.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
            starIcon.leadingAnchor.constraint(equalTo: scoreLabel.trailingAnchor, constant: 2),
            starIcon.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor, constant: -16),
            starIcon.heightAnchor.constraint(equalToConstant: 16),
        ])
    }

    private func setupLayer() {
        photo.layer.cornerRadius = 16
        photo.layer.masksToBounds = true
        distanceView.layer.cornerRadius = 16
        distanceView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        distanceView.layer.borderWidth = 1
        scoreView.layer.cornerRadius = 16
        scoreView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        scoreView.layer.borderWidth = 1
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
        }
    }

    private func calculateDistance(lat: Float, lon: Float) {
        let latitude = CLLocationDegrees(floatLiteral: Double(lat))
        let longitude = CLLocationDegrees(floatLiteral: Double(lon))
        let restaurantCoordinates = CLLocation(latitude: latitude, longitude: longitude)
        let userLocation = CLLocation(latitude: CLLocationDegrees(floatLiteral: -19.887244514643392), longitude: CLLocationDegrees(floatLiteral: -43.90674434039457))
        let distance = restaurantCoordinates.distance(from: userLocation)/1000

        distanceLabel.text = String(format: "%.3f km", distance)
    }

    func configure(type: CategoryType, restaurant: Restaurant) {
        nameLabel.text = restaurant.poi?.name ?? "No name"
        scoreLabel.text = String(format: "%.2f", restaurant.score ?? 0)
        chooseImage(type)
        calculateDistance(lat: restaurant.position?.lat ?? 0, lon: restaurant.position?.lon ?? 0)
    }
}

extension RestaurantTableViewCell: Stylable {
    func setupColors() {
        starIcon.tintColor = .systemYellow
    }

    func setupImages() {
        photo.contentMode = .scaleToFill
        photo.backgroundColor = .red
        starIcon.image = .star
        starIcon.contentMode = .scaleAspectFit
    }

    func setupFonts() {
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        distanceLabel.font = .systemFont(ofSize: 14, weight: .regular)
        scoreLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
}
