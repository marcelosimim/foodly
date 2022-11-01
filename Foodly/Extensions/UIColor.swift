//
//  UIColor.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

extension UIColor {
    static var mainRed: UIColor { colorBuilder("mainRed") }

    static func colorBuilder(_ name: String) -> UIColor {
        UIColor(named: name) ?? .clear
    }
}
