//
//  PerfilTableViewCellModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import UIKit

struct PerfilTableViewCellModel {
    let icon: UIImage
    let title: String
    let type: PerfilTableViewCellType

    init(icon: UIImage, title: String, type: PerfilTableViewCellType) {
        self.icon = icon
        self.title = title
        self.type = type
    }
}
