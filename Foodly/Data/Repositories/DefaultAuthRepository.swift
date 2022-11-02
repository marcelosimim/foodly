//
//  DefaultAuthRepository.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import FirebaseAuth
import Foundation

class DefaultAuthRepository: AuthRepository {

    func signUp(email: String, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            completion(error)
        }
    }
}
