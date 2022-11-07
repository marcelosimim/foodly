//
//  HomeViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class AfterLoginViewController: UITabBarController, Coordinating {
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        setScreens()
        setupColors()
        selectedIndex = 0
    }

    private func setScreens() {
        let home = HomeViewController()
        home.title = "Home"
        home.coodinator = coodinator
        let search = SearchViewController()
        search.title = "Search"
        search.coodinator = coodinator
        let perfil = PerfilViewController()
        perfil.title = "Perfil"
        perfil.coodinator = coodinator

        setViewControllers([home, search, perfil], animated: true)
        setupIcons()
    }

    private func setupColors() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }

    private func setupIcons() {
        guard let items = tabBar.items else { return }

        items[0].image = .homeIcon
        items[1].image = .search
        items[2].image = .perfil
    }
}
