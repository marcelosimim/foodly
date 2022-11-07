//
//  RestaurantPoiModelBuilder.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/6/22.
//

import Foundation

class RestaurantPoiModelBuilder {
    private var restauntPoiModel = RestaurantPoiModel()

    func withName(_ name: String?) -> RestaurantPoiModelBuilder {
        restauntPoiModel.name = name
        return self
    }

    func build() -> RestaurantPoiModel {
        restauntPoiModel
    }
}
