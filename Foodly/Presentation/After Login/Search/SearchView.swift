//
//  SearchView.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import UIKit

class SearchView: UIView {
    private let topCategoriesLabel = UILabel()
    let searchBar = SearchBar()
    let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collection.showsVerticalScrollIndicator = true
        return collection
    }()
    let searchResultsLabel = UILabel()
    let searchResultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: RestaurantTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([searchBar, topCategoriesLabel, categoryCollectionView, searchResultsLabel, searchResultsTableView])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.centerXAnchor.constraint(equalTo: centerXAnchor),

            topCategoriesLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 26),
            topCategoriesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            searchResultsLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 26),
            searchResultsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            categoryCollectionView.topAnchor.constraint(equalTo: topCategoriesLabel.bottomAnchor, constant: 0),
            categoryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            categoryCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

            searchResultsTableView.topAnchor.constraint(equalTo: searchResultsLabel.bottomAnchor, constant: 20),
            searchResultsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchResultsTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchResultsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func topCategoriesMode() {
        topCategoriesLabel.isHidden = false
        categoryCollectionView.isHidden = false
        searchResultsLabel.isHidden = true
        searchResultsTableView.isHidden = true
    }

    func searchResultMode() {
        categoryCollectionView.isHidden = true
        topCategoriesLabel.isHidden = true
        searchResultsLabel.isHidden = false
        searchResultsTableView.isHidden = false
    }

    func setupResultsLabel(numberOfResults: Int) {
        searchResultsLabel.text = numberOfResults == 0 ? "No results" : "\(numberOfResults) results"
    }
}

extension SearchView: Stylable {
    func setupColors() {
        backgroundColor = .white
        categoryCollectionView.backgroundColor = .white
    }

    func setupTexts() {
        topCategoriesLabel.text = "Top Categories"
    }

    func setupFonts() {
        topCategoriesLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        searchResultsLabel.font = .systemFont(ofSize: 20, weight: .regular)
    }
}
