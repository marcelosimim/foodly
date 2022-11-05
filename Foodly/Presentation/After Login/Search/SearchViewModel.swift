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
    var categories = [  Category(image: .pizzaCategory, type: .pizza),
                        Category(image: .hamburguerCategory, type: .hamburguer),
                        Category(image: .meatCategory, type: .meat),
                        Category(image: .hotdogCategory, type: .hotdog),
                        Category(image: .chickenCategory, type: .chicken),
                        Category(image: .fishCategory, type: .fish),
                        Category(image: .japaneseCategory, type: .japanese),
                        Category(image: .chineseCategory, type: .chinese),
                        Category(image: .mexicanCategory, type: .mexican),
                        Category(image: .italianCategory, type: .italian),
                        Category(image: .coffeeCategory, type: .coffee),
                        Category(image: .bakeryCategory, type: .bakery),
                        Category(image: .acaiCategory, type: .acai),
                        Category(image: .icecream, type: .icecream)]


}
