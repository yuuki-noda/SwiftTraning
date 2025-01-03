//
//  UICollectionViewSample1ViewController.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/03.
//

import UIKit

final class UICollectionViewSample1ViewController: UIViewController {
    private static let columns: Int = 3
    private static let rows: Int = 3
    
    typealias Cell = UICollectionViewSample1CollectionViewCell
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(Cell.nib, forCellWithReuseIdentifier: Cell.identifier)
        }
    }
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionViewFlowLayout.minimumLineSpacing = 16
            collectionViewFlowLayout.minimumInteritemSpacing = 16
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
}

extension UICollectionViewSample1ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Self.columns * Self.rows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath)
        if let cell = cell as? Cell {
            return cell
        }
        return cell
    }
}

extension UICollectionViewSample1ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalMargin: CGFloat = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let width: CGFloat = (collectionView.bounds.width - (horizontalMargin * CGFloat(Self.rows + 1))) / CGFloat(Self.rows)
        let floorWidth: CGFloat = floor(width)
        let verticalMargin: CGFloat = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing ?? 0
        let height: CGFloat = (collectionView.bounds.height - (verticalMargin * CGFloat(Self.columns + 1))) / CGFloat(Self.columns)
        let floorHeight: CGFloat = floor(height)
        return CGSize(width: floorWidth, height: floorHeight)
    }
}
