//
//  SearchViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Alamofire
import Foundation
import RxSwift

protocol SearchViewModel {
    var categories: BehaviorSubject<[Category]> { get }
    var restaurants: PublishSubject<[Restaurant]> { get }
    var typeSearched: CategoryType? { get set }

    func search(_ query: String)
    func clearSearch()
}

class DefaultSearchViewModel: SearchViewModel {
    private let searchUseCase: SearchUseCase
    private var latitude: Float?
    private var longitude: Float?
    var categories = BehaviorSubject(value: [ Category(image: .pizzaCategory, type: .pizza),
            Category(image: .hamburguerCategory, type: .hamburguer), Category(image: .meatCategory, type: .meat),
            Category(image: .hotdogCategory, type: .hotdog), Category(image: .chickenCategory, type: .chicken),
            Category(image: .fishCategory, type: .fish), Category(image: .japaneseCategory, type: .japanese),
            Category(image: .chineseCategory, type: .chinese), Category(image: .mexicanCategory, type: .mexican),
            Category(image: .italianCategory, type: .italian)])
    var restaurants = PublishSubject<[Restaurant]>()
    var typeSearched: CategoryType? = nil
    
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
        getUserLocation()
    }

    func search(_ query: String) {
        guard let latitude = latitude, let longitude = longitude else { return }
        searchUseCase.categorySearch(query: query, lat: "\(latitude)", lon: "\(longitude)") { [weak self] response in
            switch response {
            case .success(let restaurants):
                self?.convertFromModelArray(restaurants)
            case .failure(_):
                self?.restaurants.onNext([])
            }
        }
    }

    func clearSearch() {
        restaurants.onNext([])
    }

    private func getUserLocation() {
        latitude = UserDefaults.standard.float(forKey: "userLatitude")
        longitude = UserDefaults.standard.float(forKey: "userLongitude")
    }

    private func convertFromModelArray(_ models: [RestaurantModel]) {
        var fromModel:[Restaurant] = []
        for model in models {
            fromModel.append(Restaurant.fromModel(model))
        }

        restaurants.onNext(fromModel)
    }
}
