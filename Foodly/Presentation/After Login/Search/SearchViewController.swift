//
//  SearchViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import RxCocoa
import RxSwift
import UIKit

class SearchViewController: UIViewController, Coordinating {
    private let customView = SearchView()
    private var viewModel = AppContainer.shared.resolve(SearchViewModel.self)!
    private let disposeBag = DisposeBag()
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        customView.categoryCollectionView.delegate = self
        customView.categoryCollectionView.dataSource = self
        customView.searchResultsTableView.delegate = self
        customView.searchResultsTableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView.topCategoriesMode()
        viewModelBinds()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.clearSearch()
    }

    private func viewModelBinds() {
        viewModel.searchFinished.bind { [weak self] count in
            self?.customView.setupResultsLabel(numberOfResults: count)
            self?.customView.searchResultsTableView.reloadData()
        }.disposed(by: disposeBag)
    }
}

// MARK: - CollectionView methods

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = viewModel.categories[indexPath.row].type
        viewModel.typeSearched = category
        viewModel.search(category.rawValue)
        customView.searchResultMode()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = viewModel.categories[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { fatalError() }

        cell.configure(category.image, category.type)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width/2.15, height: 176)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
    }
}

// MARK: - TableView methods

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.restaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier) as? RestaurantTableViewCell, let searched = viewModel.typeSearched else {
            fatalError()
        }
        let resturant = viewModel.restaurants[indexPath.row]
        cell.configure(type: searched, restaurant: resturant)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
