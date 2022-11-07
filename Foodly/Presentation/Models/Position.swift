//
//  Position.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/7/22.
//

import Foundation

struct Position {
    var lat: Float?
    var lon: Float?

    static func fromModel(_ model: PositionModel) -> Position {
        Position(lat: model.lat, lon: model.lon)
    }
}
