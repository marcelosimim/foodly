//
//  RestaurantModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Foundation

struct RestaurantModel {
    var score: Float?
    var poi: RestaurantPoiModel?
    var address: AddressModel?
    var position: PositionModel?
}

struct RestaurantPoiModel {
    var name: String?
}
