//
//  Category.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/5/22.
//

import UIKit

class Category {
    let image: UIImage
    let type: CategoryType

    init(image: UIImage, type: CategoryType) {
        self.image = image
        self.type = type
    }
}
