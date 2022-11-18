//
//  SearchDetailsView.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/10/22.
//

import MapKit
import UIKit

class SearchDetailsView: UIView {
    private let nameLabel = UILabel()
    private let addressLabel = UILabel()
    let mapView = MKMapView()

    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        setupStyles()
    }

    private func addViews() {
        addSubviews([nameLabel, addressLabel, mapView])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            addressLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            mapView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 16),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configure(restaurant: Restaurant) {
        nameLabel.text = restaurant.poi?.name ?? "No name"
        addressLabel.text = restaurant.address?.freeformAddress ?? "No address"
    }
}

extension SearchDetailsView: Stylable {
    func setupColors() {
        backgroundColor = .white
    }

    func setupFonts() {
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        addressLabel.font = .systemFont(ofSize: 14, weight: .regular)
        addressLabel.textAlignment = .center
        addressLabel.numberOfLines = 0
    }
}
