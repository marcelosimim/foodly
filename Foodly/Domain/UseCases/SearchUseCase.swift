//
//  SearchUseCase.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Alamofire
import Foundation

protocol SearchUseCase {
    func categorySearch(query: String, lat: String, lon: String, completion: @escaping(Result<Array<RestaurantModel>, AFError>) -> Void)
    func nearbySearch(query: String, lat: String, lon: String)
}

class DefaultSearchUseCase: SearchUseCase {
    private let searchRepository: SearchRepository

    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }

    func categorySearch(query: String, lat: String, lon: String, completion: @escaping (Result<Array<RestaurantModel>, AFError>) -> Void) {
        searchRepository.categorySearch(query: query, lat: lat, lon: lon, completion: completion)
    }

    func nearbySearch(query: String, lat: String, lon: String) {

    }
}
