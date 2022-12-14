//
//  SceneDelegate.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import FirebaseAuth
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController()
        var coordinator: Coordinator?

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light

        if Auth.auth().currentUser == nil {
            coordinator = BeforeLoginCoordinator()
        } else {
            coordinator = AfterLoginCoordinator()
        }

        coordinator?.navigationController = navController
        coordinator?.start()
        navController.navigationBar.tintColor = .black
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

