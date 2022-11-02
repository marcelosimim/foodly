//
//  UIImage.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

extension UIImage {
    static var getStarted: UIImage { imageBuilder("getStarted") }
    static var rightArrow: UIImage { imageBuilder("rightArrow") }
    static var rightArrowNative: UIImage { UIImage(systemName: "arrow.right")! }
    static var signup1: UIImage { imageBuilder("signup1") }
    static var xmarkCircle: UIImage { imageBuilder("xmark.circle")}

    static func imageBuilder(_ name: String) -> UIImage {
        UIImage(named: name) ?? UIImage(systemName: "xmark.octagon.fill")!
    }
}
