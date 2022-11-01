//
//  GetStartedViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

class GetStartedViewController: UIViewController {
    private let customView = GetStartedView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
    }
}
