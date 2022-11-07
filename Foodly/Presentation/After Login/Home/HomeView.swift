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
    private let tableViewTitle = UILabel()
    let sortAndFilterButton = UIButton()
    let enjoyCard1 = EnjoyCard()
    let enjoyCard2 = EnjoyCard()
    let filtersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.estimatedItemSize = CGSize(width: 76, height: 34)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(FiltersCollectionViewCell.self, forCellWithReuseIdentifier: FiltersCollectionViewCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    let restaurantsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: RestaurantTableViewCell.identifier)
        tableView.isScrollEnabled = false
        return tableView
    }()
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([scrollView])
        scrollView.addSubviews([scrollViewContent])
        scrollViewContent.addSubviews([sortAndFilterButton, filtersCollectionView , enjoyCard1, enjoyCard2, tableViewTitle, restaurantsTableView, activityIndicator])
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

            tableViewTitle.topAnchor.constraint(equalTo: enjoyCard2.bottomAnchor, constant: 18),
            tableViewTitle.leadingAnchor.constraint(equalTo: sortAndFilterButton.leadingAnchor),

            restaurantsTableView.topAnchor.constraint(equalTo: tableViewTitle.bottomAnchor, constant: 16),
            restaurantsTableView.leadingAnchor.constraint(equalTo: enjoyCard1.leadingAnchor),
            restaurantsTableView.trailingAnchor.constraint(equalTo: enjoyCard2.trailingAnchor),
            restaurantsTableView.bottomAnchor.constraint(equalTo: scrollViewContent.bottomAnchor),
            restaurantsTableView.heightAnchor.constraint(equalToConstant: 236*10),

            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: enjoyCard1.bottomAnchor, constant: 230),
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
        tableViewTitle.text = "Special Offers"
    }

    func setupFonts() {
        tableViewTitle.font = .systemFont(ofSize: 24, weight: .semibold)
    }
}
