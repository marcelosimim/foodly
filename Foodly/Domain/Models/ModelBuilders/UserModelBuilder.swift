//
//  UserModelBuilder.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

class UserModelBuilder {
    private var userModel = UserModel()

    func withName(name: String?) -> UserModelBuilder {
        userModel.name = name
        return self
    }

    func withEmail(email: String?) -> UserModelBuilder {
        userModel.email = email
        return self
    }

    func withPhoto(photo: Data?) -> UserModelBuilder {
        userModel.photo = photo
        return self
    }

    func build() -> UserModel {
        userModel
    }
}
