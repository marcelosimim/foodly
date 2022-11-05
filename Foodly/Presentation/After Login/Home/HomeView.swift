//
//  HomeView.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/3/22.
//

import UIKit

class HomeView: UIView {
    private let scrollView = UIScrollView()
    private let scrollViewContent = UIView()
    let sortAndFilterButton = UIButton()
    let enjoyCard1 = EnjoyCard()
    let enjoyCard2 = EnjoyCard()
    let filtersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(FiltersCollectionViewCell.self, forCellWithReuseIdentifier: FiltersCollectionViewCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([scrollView])
        scrollView.addSubviews([scrollViewContent])
        scrollViewContent.addSubviews([sortAndFilterButton, filtersCollectionView , enjoyCard1, enjoyCard2])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            scrollViewContent.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            sortAndFilterButton.topAnchor.constraint(equalTo: scrollViewContent.topAnchor),
            sortAndFilterButton.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 16),

            filtersCollectionView.centerYAnchor.constraint(equalTo: sortAndFilterButton.centerYAnchor),
            filtersCollectionView.leadingAnchor.constraint(equalTo: sortAndFilterButton.trailingAnchor, constant: 8),
            filtersCollectionView.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor),
            filtersCollectionView.heightAnchor.constraint(equalToConstant: 34),

            enjoyCard1.topAnchor.constraint(equalTo: sortAndFilterButton.bottomAnchor, constant: 26),
            enjoyCard1.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 16),
            enjoyCard1.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-32-24)/2),

            enjoyCard2.topAnchor.constraint(equalTo: enjoyCard1.topAnchor),
            enjoyCard2.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -16),
            enjoyCard2.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-32-24)/2),



            enjoyCard2.bottomAnchor.constraint(equalTo: scrollViewContent.bottomAnchor)
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
