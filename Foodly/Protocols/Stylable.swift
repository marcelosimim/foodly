//
//  Stylable.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/1/22.
//

import Foundation

public protocol Stylable {
    func setupTexts()
    func setupFonts()
    func setupImages()
    func setupColors()
}

public extension Stylable {
    func setupStyles() {
        setupTexts()
        setupFonts()
        setupImages()
        setupColors()
    }

    func setupFonts() { }

    func setupImages() { }

    func setupTexts() { }

    func setupColors() { }
}
