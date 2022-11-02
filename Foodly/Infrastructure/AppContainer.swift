//
//  AppContainer.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import Foundation
import Swinject

class AppContainer {
    static let shared: Container = {
        let container = Container()
        container.register(SignUpStep1ViewModel.self) { _ in DefaultSignUpStep1ViewModel()}
        container.register(SignUpStep2ViewModel.self) { _ in DefaultSignUpStep2ViewModel()}
        return container
    }()
}
