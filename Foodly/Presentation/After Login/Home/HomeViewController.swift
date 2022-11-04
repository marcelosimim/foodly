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
            let vc =   UIViewController()
            vc.view  = EnjoyCardDetails()
            self?.modalPresentationStyle = .currentContext
            self?.present(vc, animated: true)
            // self?.customView.enjoyDetails.isHidden.toggle()
        }.disposed(by: disposeBag)
    }
}
