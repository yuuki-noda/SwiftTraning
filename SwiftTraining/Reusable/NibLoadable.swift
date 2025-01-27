//
//  NibLoadable.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/17.
//

import UIKit

public protocol NibLoadable: AnyObject {
  static var nib: UINib { get }
}

public extension NibLoadable {
  static var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }
}

public extension NibLoadable where Self: UIView {
  static func loadFromNib() -> Self {
    guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
      fatalError()
    }
    return view
  }
}
