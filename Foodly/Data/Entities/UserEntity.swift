//
//  UserEntity.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

struct UserEntity {
    let name: String?
    let email: String?
    let photo: Data?

    func toModel() -> UserModel {
        UserModelBuilder()
            .withName(name: name)
            .withEmail(email: email)
            .withPhoto(photo: photo)
            .build()
    }
}
