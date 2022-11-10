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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindObservables()
        bindActions()
    }

    private func bindObservables() {
        viewModel.restaurants.bind(to: customView.restaurantsTableView.rx.items(cellIdentifier: RestaurantTableViewCell.identifier, cellType: RestaurantTableViewCell.self)) { [weak self] (_, restaurant, cell) in
            cell.configure(type: .restaurant, restaurant: restaurant)
            self?.customView.activityIndicator.stopAnimating()
        }.disposed(by: disposeBag)

        viewModel.filterCells.bind(to: customView.filtersCollectionView.rx.items(cellIdentifier: FiltersCollectionViewCell.identifier, cellType: FiltersCollectionViewCell.self)) { (_, filter, cell) in
            cell.setup(filter)
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
}

extension HomeViewController: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("\(locValue.latitude) \(locValue.longitude)")
        viewModel.saveCurrentLocation(lat: locValue.latitude, lon: locValue.longitude)
        locationManager.stopUpdatingLocation()
    }
}
