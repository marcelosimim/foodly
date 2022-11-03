//
//  BlackButton.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

class BlackButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        layer.cornerRadius = 10
    }

    func setup(title: String) {
        setTitle(title, for: .normal)
    }
}

extension BlackButton: Stylable {
    func setupColors() {
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
    }

    func setupFonts() {
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
}
