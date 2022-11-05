//
//  HomeViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/4/22.
//

import Foundation

protocol HomeViewModel {
    var filterCells: [String] { get }
}

class DefaultHomeViewModel: HomeViewModel {
    var filterCells = ["Pickup", "Sort", "Top Eats", "Price range", "Dietary"]
}
