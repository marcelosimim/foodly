//
//  RestaurantPoi.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/7/22.
//

import Foundation

struct RestaurantPoi {
    var name: String?

    static func fromModel(_ model: RestaurantPoiModel) -> RestaurantPoi {
        RestaurantPoi(name: model.name)
    }
}
