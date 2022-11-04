//
//  UIColor.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

extension UIColor {
    static var mainRed: UIColor { colorBuilder("mainRed") }
    static var textFieldBorder: UIColor { colorBuilder("textFieldBorder") }
    static var cellRedBackground: UIColor { colorBuilder("cellRedBackground") }
    static var cellBlueBackground: UIColor { colorBuilder("cellBlueBackground") }
    static var cellGreenBackground: UIColor { colorBuilder("cellGreenBackground") }
    static var cellPurpleBackground: UIColor { colorBuilder("cellPurpleBackground") }
    static var cellYellowBackground: UIColor { colorBuilder("cellYellowBackground") }
    static var cellDarkBlueBackground: UIColor { colorBuilder("cellDarkBlueBackground") }
    static var lightYellow: UIColor { colorBuilder("lightYellow") }
    static var lightRed: UIColor { colorBuilder("lightRed") }

    static func colorBuilder(_ name: String) -> UIColor {
        UIColor(named: name) ?? .clear
    }
}
