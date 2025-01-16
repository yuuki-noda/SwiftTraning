//
//  UICollectionViewSample2ViewController.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/03.
//

import UIKit

final class UICollectionViewSample2ViewController: UIViewController {
    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        return UICollectionViewCompositionalLayout.init { [weak self] section, environment in
            guard let weakSelf = self else {
                return .none
            }
            guard weakSelf.sections.count > section else {
                return .none
            }
            return weakSelf.sections[section].layoutSection(weakSelf.collectionView, environment: environment)
        }
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var collectionViewDataSource: UICollectionViewDiffableDataSource<AnyHashable, AnyHashable> = {
        return UICollectionViewDiffableDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let weakSelf = self else {
                return UICollectionViewCell()
            }
            guard weakSelf.sections.count > indexPath.section else {
                return UICollectionViewCell()
            }
            return weakSelf.sections[indexPath.section].cell(collectionView, indexPath: indexPath)
        }
    }()
    
    private var sections: [BannerCarouselSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        applySnapshot(
            sections: [
                BannerCarouselSection(
                    banners: [
                        Banner(color: .cyan),
                        Banner(color: .cyan),
                        Banner(color: .cyan),
                    ]
                )
            ]
        )
    }
    
    func applySnapshot(sections: [BannerCarouselSection]) {
        self.sections = sections
        var snapshot = NSDiffableDataSourceSnapshot<AnyHashable, AnyHashable>()
        for section in self.sections {
            snapshot.appendSections([section.identifier])
            snapshot.appendItems(section.banners.map{ $0.identifier }, toSection: section.identifier)
        }
        collectionViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}
