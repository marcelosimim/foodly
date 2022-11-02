//
//  UserRepository.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

protocol UserRepository {
    func saveNewUser(user: UserModel, completion: @escaping(Error?) -> Void)
    func saveUserPhoto(photo: Data, completion: @escaping(Error?) -> Void)
}
