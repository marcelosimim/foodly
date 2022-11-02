//
//  Coordinator.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

enum Event {
    case getStartedTapped
    case signUpStep1Tapped
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }

    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coodinator: Coordinator? { get set }
}
