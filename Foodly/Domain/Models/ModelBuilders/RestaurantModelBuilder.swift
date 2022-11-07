//
//  RestaurantModelBuilder.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/6/22.
//

import Foundation

class RestaurantModelBuilder {
    private var restaurantModel = RestaurantModel()

    func withScore(score: Float?) -> RestaurantModelBuilder {
        restaurantModel.score = score
        return self
    }

    func withPoi(poi: RestaurantPoiEntity?) -> RestaurantModelBuilder {
        guard let poi = poi else { return self }
        restaurantModel.poi = poi.toModel()
        return self
    }

    func withAddress(address: AddressEntity?) -> RestaurantModelBuilder {
        guard let address = address else { return self }
        restaurantModel.address = address.toModel()
        return self
    }

    func withPosition(position: PositionEntity?) -> RestaurantModelBuilder {
        guard let position = position else { return self }
        restaurantModel.position = position.toModel()
        return self
    }

    func build() -> RestaurantModel {
        restaurantModel
    }
}
