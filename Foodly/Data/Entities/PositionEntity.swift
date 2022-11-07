//
//  PositionEntity.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Foundation

struct PositionEntity: Decodable {
    let lat: Float?
    let lon: Float?

    func toModel() -> PositionModel {
        PositionModelBuilder()
            .withLat(lat: lat)
            .withLon(lon: lon)
            .build()
    }
}
