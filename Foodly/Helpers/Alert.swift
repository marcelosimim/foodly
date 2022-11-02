//
//  Alert.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation
import UIKit

class Alert {
    static func forError(_ viewController: UIViewController, message: String) {
        let alertController = UIAlertController(title: "Um erro ocorreu", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(cancel)
        viewController.present(alertController, animated: true)
    }
}
