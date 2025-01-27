//
//  TaskListViewController.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/17.
//

import UIKit

class TaskListViewController: UIViewController {
    struct Item {
        let title: String
        let viewContoroller: UIViewController
    }
    
    private static let items: [Item] = [
        Item(title: "入力フォームのあるPopup(task1)", viewContoroller: Task1ViewController())
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(cellType: TaskListTableViewCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = String(localized: "タスク一覧")
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        var configure = cell.defaultContentConfiguration()
        let item = Self.items[indexPath.row]
        configure.text = item.title
        cell.contentConfiguration = configure
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = Self.items[indexPath.row]
        navigationController?.pushViewController(item.viewContoroller, animated: true)
    }
}
