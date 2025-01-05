//
//  UIImageView+SetImage.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/03.
//

import UIKit

extension UIImageView {
    func setImage(_ url: URL?) {
        guard url != nil else {
            backgroundColor = UIColor.systemCyan
            return
        }
        backgroundColor = UIColor.systemCyan
        return
    }
}
