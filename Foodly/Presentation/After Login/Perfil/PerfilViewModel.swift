//
//  PerfilViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation

protocol PerfilViewModel {
    var cells: [PerfilTableViewCellModel] { get }
}

class DefaultPerfilViewModel: PerfilViewModel {
    var cells = [ PerfilTableViewCellModel(icon: .favoriteIcon, title: "Your Favorites", type: .favorites),
                  PerfilTableViewCellModel(icon: .paymentIcon, title: "Payments", type: .payments),
                  PerfilTableViewCellModel(icon: .helpIcon, title: "Help", type: .help),
                  PerfilTableViewCellModel(icon: .promotionIcon, title: "Promotions", type: .promotions),
                  PerfilTableViewCellModel(icon: .notificationIcon, title: "Notifications", type: .notifications),
                  PerfilTableViewCellModel(icon: .deliveryIcon, title: "Delivery with Foodly", type: .deliveryWith) ]
}
