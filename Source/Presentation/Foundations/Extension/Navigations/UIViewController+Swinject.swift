//
//  UIViewController+Swinject.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

protocol Swinjectable {
  static func instantiate() -> Self
}

extension UIViewController: Swinjectable {}

extension Swinjectable where Self: UIViewController {
  static func instantiate() -> Self {
    return DependecyInjection.shared.container.resolve(self)!
  }
}

