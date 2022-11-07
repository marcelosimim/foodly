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
    var categories: [Category] { get }
    var restaurants: [Restaurant] { get }
    var typeSearched: CategoryType? { get set }
    var searchFinished: PublishSubject<Int> { get }

    func search(_ query: String)
    func clearSearch()
}

class DefaultSearchViewModel: SearchViewModel {
    private let searchUseCase: SearchUseCase
    var categories = [  Category(image: .pizzaCategory, type: .pizza),
                        Category(image: .hamburguerCategory, type: .hamburguer),
                        Category(image: .meatCategory, type: .meat),
                        Category(image: .hotdogCategory, type: .hotdog),
                        Category(image: .chickenCategory, type: .chicken),
                        Category(image: .fishCategory, type: .fish),
                        Category(image: .japaneseCategory, type: .japanese),
                        Category(image: .chineseCategory, type: .chinese),
                        Category(image: .mexicanCategory, type: .mexican),
                        Category(image: .italianCategory, type: .italian)]
    var typeSearched: CategoryType? = nil
    var restaurants: [Restaurant] = []
    var searchFinished = PublishSubject<Int>()

    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }

    func search(_ query: String) {
        searchUseCase.categorySearch(query: query, lat: "-19.887244514643392", lon: "-43.90674434039457") { [weak self] response in
            switch response {
            case .success(let restaurants):
                self?.convertFromModelArray(restaurants)
                self?.searchFinished.onNext(restaurants.count)
            case .failure(_):
                self?.searchFinished.onNext(0)
            }
        }
    }

    func clearSearch() {
        restaurants = []
    }

    private func convertFromModelArray(_ models: [RestaurantModel]) {
        restaurants = []
        for model in models {
            restaurants.append(Restaurant.fromModel(model))
        }
    }
}
