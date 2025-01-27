//
//  UITableView+Reusable.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/17.
//

import UIKit

public extension UITableView {
  final func register<T: UITableViewCell>(cellType: T.Type)
    where T: Reusable & NibLoadable {
      self.register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
  }

  final func register<T: UITableViewCell>(cellType: T.Type)
    where T: Reusable {
      self.register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
  }

  final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T
    where T: Reusable {
      guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
        fatalError()
      }
      return cell
  }
}
