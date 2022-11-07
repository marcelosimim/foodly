//
//  SearchRepository.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Alamofire
import Foundation

protocol SearchRepository {
    func categorySearch(query: String, lat: String, lon: String, completion: @escaping(Result<Array<RestaurantModel>, AFError>) -> Void)
    func nearbySearch(query: String, lat: String, lon: String)
}
