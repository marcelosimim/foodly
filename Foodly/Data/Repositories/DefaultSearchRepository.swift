//
//  DefaultSearchRepository.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Alamofire

class DefaultSearchRepository: SearchRepository {
    func categorySearch(query: String, lat: String, lon: String, completion: @escaping(Result<Array<RestaurantModel>, AFError>) -> Void) {
        let url = "\(K.TomtomAPI.baseURL)/search/2/categorySearch/\(query.adjustURL()).json?lat=\(lat)&lon=\(lon)&view=Unified&relatedPois=all&key=\(K.TomtomAPI.apiKey)"
        let request = AF.request(url)
        request.responseDecodable(of: RestaurantsEntity.self) { response in
            guard let value = response.value else {
                print(response.error)
                completion(.failure(response.error!))
                return
            }
            completion(.success(value.toModel()))
        }
    }

    func nearbySearch(query: String, lat: String, lon: String) {

    }
}
