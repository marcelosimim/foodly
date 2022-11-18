//
//  PerfilViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit
import RxCocoa
import RxSwift

class PerfilViewController: UIViewController, Coordinating {
    private let customView = PerfilView()
    private let viewmodel = AppContainer.shared.resolve(PerfilViewModel.self)!
    private let disposeBag = DisposeBag()
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        viewModelBinds()
        tableViewBinds()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewmodel.getUserName()
        viewmodel.getUserPhoto()
    }

    private func viewModelBinds() {
        viewmodel.userName.bind { [weak self] name in
            self?.customView.nameLabel.text = name
        }.disposed(by: disposeBag)
        viewmodel.userPhoto.bind { [weak self] data in
            self?.customView.userPhoto.changeImage(data)
        }.disposed(by: disposeBag)
    }

    private func tableViewBinds() {
        viewmodel.cells.bind(to: customView.tableView.rx.items(cellIdentifier: PerfilTableViewCell.identifier, cellType: PerfilTableViewCell.self)) { [weak self] (index, model, cell) in
            guard let self = self else { return }
            let currentIndex = self.viewmodel.cells.value[index]

            cell.type = currentIndex.type
            cell.configure(icon: currentIndex.icon, title: currentIndex.title)
        }.disposed(by: disposeBag)

        customView.tableView.rx.itemSelected.bind { [weak self] indexPath in
            guard let cell = self?.customView.tableView.cellForRow(at: indexPath) as? PerfilTableViewCell else { return }
            cell.wasSelected()
            self?.customView.tableView.deselectRow(at: indexPath, animated: true)
        }.disposed(by: disposeBag)
    }
}
