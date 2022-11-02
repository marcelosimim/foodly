//
//  User.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

struct User {
    var name: String?
    var email: String?
    var photo: Data?

    func toModel() -> UserModel {
        UserModelBuilder()
            .withName(name: name)
            .withEmail(email: email)
            .withPhoto(photo: photo)
            .build()
    }
}
