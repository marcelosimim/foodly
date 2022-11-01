//
//  RedButton.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import UIKit

class RedButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyles()
        layer.cornerRadius = 10
    }

    func setupTitle(title: String) {
        setTitle(title, for: .normal)
    }

    func setupRightIcon(icon: UIImage) {
        setImage(icon, for: .normal)
        semanticContentAttribute = .forceRightToLeft
        imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width + 35), bottom: 5, right: 0)
    }
}

extension RedButton: Stylable {
    func setupColors() {
        backgroundColor = .mainRed
    }

    func setupFonts() {
        titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
}
