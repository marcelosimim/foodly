//
//  HomeViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import RxCocoa
import RxSwift
import UIKit

class HomeViewController: UIViewController, Coordinating {
    private let customView = HomeView()
    private let disposeBag = DisposeBag()
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindActions()
    }

    private func bindActions() {
        customView.enjoyCard1.seeDetailsButton.rx.tap.bind { [weak self] _ in
            let vc = EnjoyDetailsViewController()
            vc.discountLabel = "Enjoy 25% Off (upto US $7)"
            self?.modalPresentationStyle = .currentContext
            self?.present(vc, animated: true)
        }.disposed(by: disposeBag)

        customView.enjoyCard2.seeDetailsButton.rx.tap.bind { [weak self] _ in
            let vc = EnjoyDetailsViewController()
            vc.discountLabel = "Enjoy 35% Off(upto US $12)"
            self?.modalPresentationStyle = .currentContext
            self?.present(vc, animated: true)
        }.disposed(by: disposeBag)
    }
}
