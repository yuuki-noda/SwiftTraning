//
//  UICollectionViewSample1CollectionViewCell.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/03.
//

import UIKit

final class UICollectionViewSample1CollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: type(of: self))
    }
    
    static let nib: UINib = UINib(nibName: "UICollectionViewSample1CollectionViewCell", bundle: nil)
}
