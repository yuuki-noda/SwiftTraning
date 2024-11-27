//
//  Sample3ViewController.swift
//  SwiftTraining
//
//  Created by yuki noda on 2024/11/27.
//

import UIKit

final class Sample3ViewController: UIViewController {
    @IBOutlet var actionSheetConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func didTapButton(_ sender: UIButton) {
        if actionSheetConstraint.constant == -200 {
            actionSheetConstraint.constant = 0
        } else {
            actionSheetConstraint.constant = -200
        }
        UIView.animate(withDuration: 0.3) {
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
}
