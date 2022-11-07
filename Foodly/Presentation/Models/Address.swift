//
//  Address.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/7/22.
//

import Foundation

struct Address {
    var streetNumber: String?
    var streetName: String?
    var localName: String?
    var municipality: String?
    var countrySubdivision: String?
    var extendedPostalCode: String?
    var country: String?
    var freeformAddress: String?

    static func fromModel(_ model: AddressModel) -> Address {
        Address(streetNumber: model.streetNumber,
                streetName: model.streetName,
                localName: model.localName,
                municipality: model.municipality,
                countrySubdivision: model.countrySubdivision,
                extendedPostalCode: model.extendedPostalCode,
                country: model.country,
                freeformAddress: model.freeformAddress)
    }
}
