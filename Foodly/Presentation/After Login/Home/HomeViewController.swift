//
//  HomeViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import CoreLocation
import RxCocoa
import RxSwift
import UIKit

class HomeViewController: UIViewController, Coordinating {
    private let customView = HomeView()
    private let disposeBag = DisposeBag()
    private let viewModel = AppContainer.shared.resolve(HomeViewModel.self)!
    private let locationManager = CLLocationManager()
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        setupLocation()
        setupCollectionView()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModelBinds()
        bindActions()
    }

    private func viewModelBinds() {
        viewModel.fetchRestaurantsFinished.bind { [weak self] count in
            count == 0 ? self?.customView.setTableViewTitle("No results") : self?.customView.setTableViewTitle("Special Offers")
            self?.customView.activityIndicator.stopAnimating()
            self?.customView.restaurantsTableView.reloadData()
        }.disposed(by: disposeBag)
    }

    private func bindActions() {
        customView.enjoyCard1.seeDetailsButton.rx.tap.bind { [weak self] _ in
            let vc = EnjoyDetailsViewController()
            vc.discountLabel = "Enjoy 25% Off (upto US $7)"
            self?.modalPresentationStyle = .currentContext
            self?.present(vc, animated: true)
        }.disposed(by: disposeBag)

        customView.enjoyCard2.seeDetailsButton.rx.tap.bind { [weak self] _ in
            let vc = EnjoyDetailsViewController()
            vc.discountLabel = "Enjoy 35% Off(upto US $12)"
            self?.modalPresentationStyle = .currentContext
            self?.present(vc, animated: true)
        }.disposed(by: disposeBag)
    }

    private func setupLocation() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    private func setupCollectionView() {
        customView.filtersCollectionView.delegate = self
        customView.filtersCollectionView.dataSource = self
    }

    private func setupTableView() {
        customView.restaurantsTableView.delegate = self
        customView.restaurantsTableView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filterCells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.identifier, for: indexPath) as? FiltersCollectionViewCell else {
            fatalError()
        }

        cell.setup(viewModel.filterCells[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 76, height: collectionView.bounds.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.restaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier) as? RestaurantTableViewCell else { fatalError() }
        let restaurant = viewModel.restaurants[indexPath.row]

        cell.configure(type: .restaurant, restaurant: restaurant)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        viewModel.saveCurrentLocation(lat: locValue.latitude, lon: locValue.longitude)
    }
}
