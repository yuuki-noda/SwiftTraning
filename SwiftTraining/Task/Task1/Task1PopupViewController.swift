//
//  Task1PopupViewController.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/17.
//

import UIKit

final class Task1PopupViewController: UIViewController {
    @IBOutlet private var popupView: UIView!
    @IBOutlet private var textField: UITextField!
    @IBOutlet private var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
        let popupTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapPopupView))
        popupView.addGestureRecognizer(popupTapGesture)
        textField.delegate = self
    }
    
    @objc private func didTapView() {
        self.dismiss(animated: true)
    }
    
    @objc private func didTapPopupView() {
        view.endEditing(true)
    }
}

extension Task1PopupViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view == view {
            return true
        }
        return false
    }
}

extension Task1PopupViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        label.text = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
