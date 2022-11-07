//
//  AddressEntity.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Foundation

struct AddressEntity: Decodable {
    let streetNumber: String?
    let streetName: String?
    let localName: String?
    let municipality: String?
    let countrySubdivision: String?
    let extendedPostalCode: String?
    let country: String?
    let freeformAddress: String?

    func toModel() -> AddressModel {
        AddressModelBuilder()
            .withStreetNumber(streetNumber)
            .withStreetName(streetName)
            .withLocalName(localName)
            .withMunicipality(municipality)
            .withCountrySubdivision(countrySubdivision)
            .withExtendedPostalCode(extendedPostalCode)
            .withCountry(country)
            .withFreeformAddress(freeformAddress)
            .build()
    }
}
