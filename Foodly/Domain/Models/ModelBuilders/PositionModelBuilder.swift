//
//  PositionModelBuilder.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/6/22.
//

import Foundation

class PositionModelBuilder {
    private var positionModel = PositionModel()

    func withLat(lat: Float?) -> PositionModelBuilder {
        positionModel.lat = lat
        return self
    }

    func withLon(lon: Float?) -> PositionModelBuilder {
        positionModel.lon = lon
        return self
    }

    func build() -> PositionModel {
        positionModel
    }
}
