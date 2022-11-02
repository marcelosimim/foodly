//
//  MainCoordinator.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?

    func eventOccurred(with type: Event) {
        switch type {
        case .getStartedTapped:
            var vc: UIViewController & Coordinating = SignUpStep1ViewController()
            vc.coodinator = self
            navigationController?.pushViewController(vc, animated: true)
        case .signUpStep1Tapped:
            var vc: UIViewController & Coordinating = SignUpStep2ViewController()
            vc.coodinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func start() {
        var vc: UIViewController & Coordinating = GetStartedViewController()
        vc.coodinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
