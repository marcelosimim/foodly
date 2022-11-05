//
//  SearchView.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import UIKit

class SearchView: UIView {
    lazy var searchBar: SearchBar = {
        let searchBar = SearchBar()
        return searchBar
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([searchBar])
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

extension SearchView: Stylable {
    func setupColors() {
        backgroundColor = .white
    }
}
