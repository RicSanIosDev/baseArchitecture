//
//  Closable.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

protocol Closable: AnyObject {
    func smartClose(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension Closable {
    func smartClose(animated: Bool) {
        let topVC = UIApplication.topViewController()

        // Pop if there is a Navigation Controller
        if let nav = topVC?.parent as? UINavigationController, nav.viewControllers.count > 1 {
            nav.popViewController(animated: animated)
        } else {
            topVC?.dismiss(animated: animated, completion: nil)
        }
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        UIApplication.topViewController()?.dismiss(animated: animated, completion: completion)
    }
}
