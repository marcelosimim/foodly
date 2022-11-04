//
//  EnjoyDetailsViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/4/22.
//

import UIKit

class EnjoyDetailsViewController: UIViewController {
    private let customView = EnjoyCardDetails()
    var discountLabel: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        setupDiscountLabel(discountLabel)
    }

    private func setupDiscountLabel(_ text: String?) {
        guard let text = text else { return }
        customView.setupDiscountLabel(text)
    }
}
