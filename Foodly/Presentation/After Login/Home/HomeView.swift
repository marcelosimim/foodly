//
//  HomeView.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/3/22.
//

import UIKit

class HomeView: UIView {
    let sortAndFilterButton = UIButton()
    let enjoyCard1 = EnjoyCard()
    let enjoyCard2 = EnjoyCard()
//    let enjoyDetails: EnjoyCardDetails = {
//        let enjoyDetails = EnjoyCardDetails()
//        enjoyDetails.isHidden = true
//        return enjoyDetails
//    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([sortAndFilterButton, enjoyCard1, enjoyCard2])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sortAndFilterButton.topAnchor.constraint(equalTo: topAnchor, constant: 94),
            sortAndFilterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            enjoyCard1.topAnchor.constraint(equalTo: sortAndFilterButton.bottomAnchor, constant: 26),
            enjoyCard1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            enjoyCard1.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-32-24)/2),

            enjoyCard2.topAnchor.constraint(equalTo: enjoyCard1.topAnchor),
            enjoyCard2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            enjoyCard2.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-32-24)/2),

//            enjoyDetails.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
//            enjoyDetails.leadingAnchor.constraint(equalTo: leadingAnchor),
//            enjoyDetails.trailingAnchor.constraint(equalTo: trailingAnchor),
//            enjoyDetails.heightAnchor.constraint(equalToConstant: 414),
        ])
    }
}

extension HomeView: Stylable {
    func setupColors() {
        backgroundColor = .white
        enjoyCard1.setupColor(.lightYellow)
        enjoyCard2.setupColor(.lightRed)
    }

    func setupImages() {
        sortAndFilterButton.setImage(.sortAndFilter, for: .normal)
        enjoyCard1.setupImage(.icecream)
        enjoyCard2.setupImage(.popsicle)
    }

    func setupTexts() {
        enjoyCard1.setupLabels(main: "Enjoy 25% Off\n(upto US $7)", second: "Your frist two orders")
        enjoyCard2.setupLabels(main: "Enjoy 35% Off\n(upto US $12)", second: "Your frist two orders")
    }
}
