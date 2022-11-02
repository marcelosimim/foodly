//
//  UserUseCase.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

protocol UserUseCase {
    func saveNewUser(user: UserModel, completion: @escaping(Error?) -> Void)
}

class DefaultUserUseCase: UserUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func saveNewUser(user: UserModel, completion: @escaping (Error?) -> Void) {
        userRepository.saveNewUser(user: user, completion: completion)
    }
}
