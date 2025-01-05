//
//  BannerCarouselCell.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/03.
//

import UIKit

class BannerCarouselCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: type(of: self))
    }
    
    static let nib: UINib = UINib(nibName: "BannerCarouselCell", bundle: nil)
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    func configure(_ banner: Banner) {
        bannerImageView.setImage(banner.imageURL)
    }
}
