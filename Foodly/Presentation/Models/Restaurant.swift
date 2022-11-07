//
//  Restaurant.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/6/22.
//

import Foundation

struct Restaurant {
    var score: Float?
    var poi: RestaurantPoi?
    var address: Address?
    var position: Position?

    static func fromModel(_ model: RestaurantModel) -> Restaurant {
        Restaurant(score: model.score,
                   poi: RestaurantPoi.fromModel(model.poi ?? RestaurantPoiModel()),
                   address: Address.fromModel(model.address ?? AddressModel()),
                   position: Position.fromModel(model.position ?? PositionModel()))
    }
}
