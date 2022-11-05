//
//  HomeViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import RxCocoa
import RxSwift
import UIKit

class HomeViewController: UIViewController, Coordinating {
    private let customView = HomeView()
    private let disposeBag = DisposeBag()
    private let viewModel = AppContainer.shared.resolve(HomeViewModel.self)!
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        customView.filtersCollectionView.delegate = self
        customView.filtersCollectionView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindActions()
    }

    private func bindActions() {
        customView.enjoyCard1.seeDetailsButton.rx.tap.bind { [weak self] _ in
            let vc = EnjoyDetailsViewController()
            vc.discountLabel = "Enjoy 25% Off (upto US $7)"
            self?.modalPresentationStyle = .currentContext
            self?.present(vc, animated: true)
        }.disposed(by: disposeBag)

        customView.enjoyCard2.seeDetailsButton.rx.tap.bind { [weak self] _ in
            let vc = EnjoyDetailsViewController()
            vc.discountLabel = "Enjoy 35% Off(upto US $12)"
            self?.modalPresentationStyle = .currentContext
            self?.present(vc, animated: true)
        }.disposed(by: disposeBag)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filterCells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.identifier, for: indexPath) as? FiltersCollectionViewCell else {
            fatalError()
        }

        cell.setup(viewModel.filterCells[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 76, height: collectionView.bounds.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}
