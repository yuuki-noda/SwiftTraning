//
//  Sample1TableViewController.swift
//  SwiftTraining
//
//  Created by yuki noda on 2024/11/27.
//

import UIKit

final class Sample1TableViewController: UIViewController {

    @IBOutlet private var tableView: UITableView! {
        willSet {
            newValue.register(
                Sample1TableViewCell.nib,
                forCellReuseIdentifier: Sample1TableViewCell.identifier
            )
            newValue.dataSource = self
            newValue.delegate = self
        }
    }
    
    private var texts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0 ..< 255 {
            texts.append(makeRandomText(i))
        }
    }

    private func makeRandomText(_ length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 0 ..< length {
            randomString += String(letters.randomElement()!)
        }
        return randomString
    }
}

extension Sample1TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Sample1TableViewCell.identifier, for: indexPath)
        guard let cell = cell as? Sample1TableViewCell else {
            return cell
        }
        cell.configure(text: texts[indexPath.row])
        return cell
    }
}

extension Sample1TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
