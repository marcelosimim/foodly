//
//  GetStartedViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import RxCocoa
import UIKit

class GetStartedViewController: UIViewController, Coordinating {
    private let customView = GetStartedView()
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        customView.setup()
        setupButtons()
    }

    private func setupButtons() {
        customView.getStartedButton.addTarget(self, action: #selector(getStartedPressed), for: .touchDown)
    }

    @objc private func getStartedPressed() {
        coodinator?.eventOccurred(with: .getStartedTapped)
    }
}
