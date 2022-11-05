//
//  SearchViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import Foundation

protocol SearchViewModel {
    var categories: [Category] { get }
}

class DefaultSearchViewModel: SearchViewModel {
    var categories = [ Category(name: "Pizza", image: .pizzaCategory),
                       Category(name: "Hamburguer", image: .hamburguerCategory),
                       Category(name: "Meat", image: .meatCategory),
                       Category(name: "Hot dog", image: .hotdogCategory),
                       Category(name: "Chicken", image: .chickenCategory),
                       Category(name: "Fish", image: .fishCategory),
                       Category(name: "Japanese", image: .japaneseCategory),
                       Category(name: "Chinese", image: .chineseCategory),
                       Category(name: "Mexican", image: .mexicanCategory),
                       Category(name: "Italian", image: .italianCategory),
                       Category(name: "Coffee", image: .coffeeCategory),
                       Category(name: "Bakery", image: .bakeryCategory),
                       Category(name: "Açai", image: .acaiCategory),
                       Category(name: "Ice cream", image: .icecream),]


}
