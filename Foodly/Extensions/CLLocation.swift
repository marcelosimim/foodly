//
//  CLLocation.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/7/22.
//

import CoreLocation

extension CLLocation {
    static func newLocation(lat: Double, lon: Double) -> CLLocation {
        let newLat = CLLocationDegrees(floatLiteral: Double(lat))
        let newLon = CLLocationDegrees(floatLiteral: Double(lon))

        return CLLocation(latitude: newLat, longitude: newLon)
    }

    static func fromCLLocationCoordinate2D(coordinate: CLLocationCoordinate2D) -> CLLocation {
        let newLat = CLLocationDegrees(floatLiteral: coordinate.latitude)
        let newLon = CLLocationDegrees(floatLiteral: coordinate.longitude)

        return CLLocation(latitude: newLat, longitude: newLon)
    }
}
