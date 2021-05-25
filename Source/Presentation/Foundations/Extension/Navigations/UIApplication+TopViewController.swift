//
//  UIApplication+TopViewController.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

extension UIApplication {

  class func topViewController(_ base: UIViewController? = nil) -> UIViewController? {

    var baseVC = base

    if baseVC == nil {
      baseVC = shared.windows.first { $0.isKeyWindow }?.rootViewController
    }

    if let nav = baseVC as? UINavigationController {
      return topViewController(nav.visibleViewController)
    }

    if let tab = baseVC as? UITabBarController, let selected = tab.selectedViewController {
      return topViewController(selected)
    }

    if let presented = baseVC?.presentedViewController {
      return topViewController(presented)
    }

    return baseVC
  }
}
