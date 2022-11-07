//
//  HomeViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/4/22.
//

import Foundation
import RxSwift

protocol HomeViewModel {
    var filterCells: [String] { get }
    var fetchRestaurantsFinished: PublishSubject<Int> { get }
    var restaurants: [Restaurant] { get }

    func saveCurrentLocation(lat: Double, lon: Double)
}

class DefaultHomeViewModel: HomeViewModel {
    private let searchUseCase: SearchUseCase
    private var latitude: Double?
    private var longitude: Double?
    var filterCells = ["Pickup", "Sort", "Top Eats", "Price range", "Dietary"]
    var fetchRestaurantsFinished = PublishSubject<Int>()
    var restaurants: [Restaurant] = []

    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }

    func saveCurrentLocation(lat: Double, lon: Double) {
        latitude = lat
        longitude = lon
        UserDefaults.standard.set(latitude, forKey: "userLatitude")
        UserDefaults.standard.set(longitude, forKey: "userLongitude")
        showRestaurants()
    }

    private func showRestaurants() {
        guard let latitude = latitude, let longitude = longitude else { return }
        searchUseCase.categorySearch(query: "restaurante", lat: "\(latitude)", lon: "\(longitude)") { [weak self] result in
            switch result {
            case .success(let restaurants):
                self?.convertFromModelArray(restaurants)
                self?.fetchRestaurantsFinished.onNext(restaurants.count)
            case .failure(_):
                self?.fetchRestaurantsFinished.onNext(0)
            }
        }
    }

    private func convertFromModelArray(_ models: [RestaurantModel]) {
        restaurants = []
        for model in models {
            restaurants.append(Restaurant.fromModel(model))
        }
    }
}
