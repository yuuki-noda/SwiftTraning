//
//  Sample1TableViewCell.swift
//  SwiftTraining
//
//  Created by yuki noda on 2024/11/27.
//

import UIKit

final class Sample1TableViewCell: UITableViewCell {
    static let identifier = "Sample1TableViewCell"
    static let nib = UINib(nibName: "Sample1TableViewCell", bundle: nil)
    
    @IBOutlet private var label: UILabel!
    
    func configure(text: String) {
        label.text = text
    }
}
