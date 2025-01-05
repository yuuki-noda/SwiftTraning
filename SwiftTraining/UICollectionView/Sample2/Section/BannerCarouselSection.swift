//
//  BannerCarouselSection.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/03.
//

import UIKit

struct BannerCarouselSection {
    typealias Cell = BannerCarouselCell
    let identifier: UUID = UUID()
    private(set) var banners: [Banner]
    private var cellRegistration: UICollectionView.CellRegistration<BannerCarouselCell, Banner>!
    
    init(banners: [Banner]) {
        self.banners = banners
        self.cellRegistration = UICollectionView.CellRegistration<BannerCarouselCell, Banner>(cellNib: Cell.nib) { cell, indexPath, banner in
            cell.configure(banner)
        }
    }
    
    func layoutSection(_ collectionView: UICollectionView, environment: any NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .fractionalWidth(((9 / 16) * 0.8))
            ),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 16
        return section
    }
    
    func cell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: banners[indexPath.row])
    }
}
