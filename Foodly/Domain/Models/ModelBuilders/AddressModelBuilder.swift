//
//  AddressModelBuilder.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/6/22.
//

import Foundation

class AddressModelBuilder {
    private var addressModel = AddressModel()

    func withStreetNumber(_ streetNumber: String?) -> AddressModelBuilder {
        addressModel.streetNumber = streetNumber
        return self
    }

    func withStreetName(_ streetName: String?) -> AddressModelBuilder {
        addressModel.streetName = streetName
        return self
    }

    func withLocalName(_ localName: String?) -> AddressModelBuilder {
        addressModel.localName = localName
        return self
    }

    func withMunicipality(_ municipality: String?) -> AddressModelBuilder {
        addressModel.municipality = municipality
        return self
    }

    func withCountrySubdivision(_ countrySubdivision: String?) -> AddressModelBuilder {
        addressModel.countrySubdivision = countrySubdivision
        return self
    }

    func withExtendedPostalCode(_ extendedPostalCode: String?) -> AddressModelBuilder {
        addressModel.extendedPostalCode = extendedPostalCode
        return self
    }

    func withCountry(_ country: String?) -> AddressModelBuilder {
        addressModel.country = country
        return self
    }

    func withFreeformAddress(_ freeformAddress: String?) -> AddressModelBuilder {
        addressModel.freeformAddress = freeformAddress
        return self
    }

    func build() -> AddressModel {
        addressModel
    }
}
