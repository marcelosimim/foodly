//
//  AfterLoginCoordinator.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class AfterLoginCoordinator: Coordinator {
    var navigationController: UINavigationController?

    func eventOccurred(with type: EventAfterLogin) {

    }

    func start() {
        var vc: UIViewController & Coordinating = HomeViewController()
        vc.coodinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
