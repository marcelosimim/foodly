//
//  UIImage.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

extension UIImage {
    static var acaiCategory: UIImage { imageBuilder("acai") }
    static var bakeryCategory: UIImage { imageBuilder("bakery") }
    static var chickenCategory: UIImage { imageBuilder("chicken") }
    static var chineseCategory: UIImage { imageBuilder("chinese") }
    static var coffeeCategory: UIImage { imageBuilder("coffee") }
    static var covidBanner: UIImage { imageBuilder("covidBanner") }
    static var defaultCheckmark: UIImage { imageBuilder("defaultCheckmark") }
    static var deliveryIcon: UIImage { imageBuilder("deliveryIcon") }
    static var enjoyDetails: UIImage { imageBuilder("enjoyDetails") }
    static var favoriteIcon: UIImage { imageBuilder("favoriteIcon") }
    static var fishCategory: UIImage { imageBuilder("fish") }
    static var getStarted: UIImage { imageBuilder("getStarted") }
    static var hamburguerCategory: UIImage { imageBuilder("hamburguer") }
    static var helpIcon: UIImage { imageBuilder("helpIcon") }
    static var homeIcon: UIImage { UIImage(systemName:"house.fill")! }
    static var hotdogCategory: UIImage { imageBuilder("hotdog") }
    static var icecream: UIImage { imageBuilder("icecream") }
    static var italianCategory: UIImage { imageBuilder("italian") }
    static var japaneseCategory: UIImage { imageBuilder("japanese") }
    static var meatCategory: UIImage { imageBuilder("meat") }
    static var mexicanCategory: UIImage { imageBuilder("mexican") }
    static var notificationIcon: UIImage { imageBuilder("notificationIcon") }
    static var paymentIcon: UIImage { imageBuilder("paymentIcon") }
    static var perfil: UIImage { UIImage(systemName:"person.fill")! }
    static var pizzaCategory: UIImage { imageBuilder("pizza") }
    static var popsicle: UIImage { imageBuilder("popsicle") }
    static var promotionIcon: UIImage { imageBuilder("promotionIcon") }
    static var rightArrow: UIImage { imageBuilder("rightArrow") }
    static var rightArrowNative: UIImage { UIImage(systemName: "arrow.right")! }
    static var search: UIImage { UIImage(systemName:"magnifyingglass")! }
    static var signup1: UIImage { imageBuilder("signup1") }
    static var signup2: UIImage { imageBuilder("signup2") }
    static var signup3: UIImage { imageBuilder("signup3") }
    static var sortAndFilter: UIImage { imageBuilder("sortAndFilter") }
    static var star: UIImage { UIImage(systemName: "star.fill")! }
    static var xmarkCircle: UIImage { UIImage(systemName: "xmark.circle.fill")! }
    
    static func imageBuilder(_ name: String) -> UIImage {
        UIImage(named: name) ?? UIImage(systemName: "xmark.octagon.fill")!
    }
}
