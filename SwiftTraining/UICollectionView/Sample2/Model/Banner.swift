//
//  Banner.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/03.
//

import Foundation
import UIKit

struct Banner {
    let identifier: UUID = UUID()
    let imageURL: URL?
    let color: UIColor?
    
    init(imageURL: URL? = nil, color: UIColor? = nil) {
        self.imageURL = imageURL
        self.color = color
    }
}
