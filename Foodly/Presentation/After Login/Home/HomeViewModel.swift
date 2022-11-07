//
//  HomeViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/4/22.
//

import Foundation
import RxSwift

protocol HomeViewModel {
    var filterCells: BehaviorSubject<[String]> { get }
    var restaurants: PublishSubject<[Restaurant]> { get }

    func saveCurrentLocation(lat: Double, lon: Double)
}

class DefaultHomeViewModel: HomeViewModel {
    private let searchUseCase: SearchUseCase
    private var latitude: Double?
    private var longitude: Double?
    var filterCells = BehaviorSubject(value: ["Pickup", "Sort", "Top Eats", "Price range", "Dietary"])
    var restaurants = PublishSubject<[Restaurant]>()

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
        searchUseCase.nearbySearch(query: "restaurante", lat: "\(latitude)", lon: "\(longitude)") { [weak self] result in
            switch result {
            case .success(let restaurants):
                self?.convertFromModelArray(restaurants)
            case .failure(_):
                break
            }
        }
    }

    private func convertFromModelArray(_ models: [RestaurantModel]) {
        var array: [Restaurant] = []
        for model in models {
            array.append(Restaurant.fromModel(model))
        }
        restaurants.onNext(array)
    }
}
