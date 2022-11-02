//
//  Coordinator.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }

    func eventOccurred(with type: EventAfterLogin)
    func eventOccurred(with type: EventBeforeLogin)
    func start()
}

protocol Coordinating {
    var coodinator: Coordinator? { get set }
}

extension Coordinator {
    func eventOccurred(with type: EventAfterLogin) { }
    func eventOccurred(with type: EventBeforeLogin) { }
}
