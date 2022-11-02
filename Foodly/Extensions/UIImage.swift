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
    static var signup2: UIImage { imageBuilder("signup2") }
    static var signup3: UIImage { imageBuilder("signup3") }
    static var xmarkCircle: UIImage { imageBuilder("xmark.circle") }
    static var homeIcon: UIImage { UIImage(systemName:"house.fill")! }
    static var search: UIImage { UIImage(systemName:"magnifyingglass")! }
    static var perfil: UIImage { UIImage(systemName:"person.fill")! }

    static func imageBuilder(_ name: String) -> UIImage {
        UIImage(named: name) ?? UIImage(systemName: "xmark.octagon.fill")!
    }
}
