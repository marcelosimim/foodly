//
//  AuthRepository.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

protocol AuthRepository {
    func signUp(email: String, password: String, completion: @escaping(Error?) -> Void)
}
