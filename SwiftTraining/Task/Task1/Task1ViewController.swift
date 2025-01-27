//
//  TaskViewController.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/17.
//

import UIKit

final class Task1ViewController: UIViewController {
    @IBAction private func didTapButton(_ sender: UIButton) {
        let popup = Task1PopupViewController()
        popup.modalTransitionStyle = .crossDissolve
        popup.modalPresentationStyle = .overFullScreen
        self.present(popup, animated: true)
    }
}
