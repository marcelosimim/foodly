//
//  SearchViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class SearchViewController: UIViewController, Coordinating {
    private let customView = SearchView()
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
    }
}
