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

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([searchBar, topCategoriesLabel, categoryCollectionView])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.centerXAnchor.constraint(equalTo: centerXAnchor),

            topCategoriesLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 26),
            topCategoriesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            categoryCollectionView.topAnchor.constraint(equalTo: topCategoriesLabel.bottomAnchor, constant: 0),
            categoryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            categoryCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
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
    }
}
