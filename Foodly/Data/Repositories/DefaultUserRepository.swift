//
//  DefaultUserRepository.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Firebase
import Foundation

class DefaultUserRepository: UserRepository {
    private let userCollectionRef = Firestore.firestore().collection("users")
    private let userStorageRef = Storage.storage()

    func saveNewUser(user: UserModel, completion: @escaping(Error?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else { return }
        let data: [String : Any] = [
            "name": user.name,
            "email": user.email ]

        userCollectionRef.document(currentUser.uid)
            .setData(data) { [weak self] error in
                guard let error = error else {
                    guard let photo = user.photo else { return }
                    self?.saveUserPhoto(photo: photo, completion: completion)
                    return
                }
                completion(error)
            }
    }

    func saveUserPhoto(photo: Data, completion: @escaping(Error?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else { return }
        userStorageRef.reference(withPath: "users/\(currentUser.uid)/perfil.png")
            .putData(photo, metadata: nil) { _, error in
                completion(error)
            }
    }
}
