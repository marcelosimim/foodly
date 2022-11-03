//
//  UserUseCase.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

protocol UserUseCase {
    func saveNewUser(user: UserModel, completion: @escaping(Error?) -> Void)
    func getUserName(completion: @escaping(Result<String, Error>) -> Void)
    func getUserPhoto(completion: @escaping(Result<Data, Error>) -> Void)
}

class DefaultUserUseCase: UserUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func saveNewUser(user: UserModel, completion: @escaping (Error?) -> Void) {
        userRepository.saveNewUser(user: user, completion: completion)
    }

    func getUserName(completion: @escaping (Result<String, Error>) -> Void) {
        userRepository.getUserName(completion: completion)
    }

    func getUserPhoto(completion: @escaping (Result<Data, Error>) -> Void) {
        userRepository.getUserPhoto(completion: completion)
    }
}
