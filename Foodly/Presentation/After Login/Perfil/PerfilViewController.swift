//
//  PerfilViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class PerfilViewController: UIViewController, Coordinating {
    private let customView = PerfilView()
    private let viewmodel = AppContainer.shared.resolve(PerfilViewModel.self)!
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
}

extension PerfilViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PerfilTableViewCell.identifier) as? PerfilTableViewCell else {
            fatalError()
        }
        let currentIndex = viewmodel.cells[indexPath.row]

        cell.type = currentIndex.type
        cell.setup(icon: currentIndex.icon, title: currentIndex.title)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? PerfilTableViewCell else { return }
        cell.wasSelected()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
