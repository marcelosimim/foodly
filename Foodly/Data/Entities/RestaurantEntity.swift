//
//  RestaurantEntity.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Foundation

struct RestaurantsEntity: Decodable {
    let results: [RestaurantEntity]

    func toModel() -> [RestaurantModel] {
        var model: [RestaurantModel] = []
        for result in results {
            model.append(result.toModel())
        }
        return model
    }
}

struct RestaurantEntity: Decodable {
    let score: Float?
    let poi: RestaurantPoiEntity?
    let address: AddressEntity?
    let position: PositionEntity?

    func toModel() -> RestaurantModel {
        RestaurantModelBuilder()
            .withScore(score: score)
            .withPoi(poi: poi)
            .withAddress(address: address)
            .withPosition(position: position)
            .build()
    }
}

struct RestaurantPoiEntity: Decodable {
    let name: String?

    func toModel() -> RestaurantPoiModel {
        RestaurantPoiModelBuilder()
            .withName(name)
            .build()
    }
}
