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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView.topCategoriesMode()
        collectionViewBinds()
        tableViewBinds()
        searchBarBinds()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.clearSearch()
    }

    private func collectionViewBinds() {
        viewModel.categories.bind(to: customView.categoryCollectionView.rx.items(cellIdentifier: CategoryCollectionViewCell.identifier, cellType: CategoryCollectionViewCell.self)) { (_, category, cell) in
            cell.configure(category.image, category.type)
        }.disposed(by: disposeBag)

        customView.categoryCollectionView.rx.itemSelected.bind { [weak self] indexPath in
            guard let self = self else { return }
            let category = self.viewModel.categories.value[indexPath.row].type
            self.viewModel.typeSearched = category
            self.viewModel.search(category.rawValue)
            self.customView.searchResultMode()
        }.disposed(by: disposeBag)
    }

    private func tableViewBinds() {
        viewModel.restaurants.bind(to: customView.searchResultsTableView.rx.items(cellIdentifier: RestaurantTableViewCell.identifier, cellType: RestaurantTableViewCell.self)) { (_, restaurant, cell) in
            cell.configure(type: .restaurant, restaurant: restaurant)
        }.disposed(by: disposeBag)

        customView.searchResultsTableView.rx.itemSelected.bind { [ weak self ] indexPath in
            guard let self = self else { return }
            let restaurant = self.viewModel.restaurants.value[indexPath.row]
            self.showDetails(restaurant)
        }.disposed(by: disposeBag)
    }

    private func searchBarBinds() {
        customView.searchBar.textField.rx.controlEvent(.editingDidEndOnExit).bind { [weak self] in
            guard let textField = self?.customView.searchBar.textField, let text = textField.text else { return }
            if !text.isEmpty {
                self?.viewModel.search(text)
                self?.customView.searchResultMode()
            }
            textField.resignFirstResponder()
        }.disposed(by: disposeBag)

        customView.searchBar.clearButton.rx.controlEvent(.touchUpInside).bind { [weak self] in
            self?.customView.searchBar.textField.text = ""
            self?.customView.topCategoriesMode()
        }.disposed(by: disposeBag)
    }

    private func showDetails(_ restaurant: Restaurant) {
        let vc = SearchDetailsViewController()
        vc.restaurant = restaurant
        navigationController?.present(vc, animated: true)
    }
}
