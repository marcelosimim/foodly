//
//  PerfilViewModel.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import Foundation
import RxSwift

protocol PerfilViewModel {
    var cells: [PerfilTableViewCellModel] { get }
    var userName: PublishSubject<String> { get }
    var userPhoto: PublishSubject<Data> { get }

    func getUserName()
    func getUserPhoto()
}

class DefaultPerfilViewModel: PerfilViewModel {
    private let userUseCase: UserUseCase
    var userName = PublishSubject<String>()
    var userPhoto = PublishSubject<Data>()
    var cells = [ PerfilTableViewCellModel(icon: .favoriteIcon, title: "Your Favorites", type: .favorites),
                  PerfilTableViewCellModel(icon: .paymentIcon, title: "Payments", type: .payments),
                  PerfilTableViewCellModel(icon: .helpIcon, title: "Help", type: .help),
                  PerfilTableViewCellModel(icon: .promotionIcon, title: "Promotions", type: .promotions),
                  PerfilTableViewCellModel(icon: .notificationIcon, title: "Notifications", type: .notifications),
                  PerfilTableViewCellModel(icon: .deliveryIcon, title: "Delivery with Foodly", type: .deliveryWith) ]

    init(userUseCase: UserUseCase) {
        self.userUseCase = userUseCase
    }

    func getUserName() {
        userUseCase.getUserName { [weak self] result in
            switch result {
            case .success(let name):
                self?.userName.onNext(name)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getUserPhoto() {
        userUseCase.getUserPhoto { [weak self] result in
            switch result {
            case .success(let data):
                self?.userPhoto.onNext(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
