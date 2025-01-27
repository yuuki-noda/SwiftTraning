//
//  Reusable.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/17.
//

import UIKit

public protocol Reusable: AnyObject {
  static var reuseIdentifier: String { get }
}

public extension Reusable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
