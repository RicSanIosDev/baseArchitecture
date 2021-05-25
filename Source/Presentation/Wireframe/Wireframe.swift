//
//  Wireframe.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import UIKit

protocol Wireframe: Closable {

    func splash() -> Screen
    func tabBar() -> Screen
    func settings() -> Screen
    func primaryView() -> Screen
    func login() -> Screen

    // MARK: - Pop current screen
    func popCurrentScreen()
    func popCurrentScreen(onCompletion: @escaping () -> Void)
    func popCurrentScreen(animated: Bool)
    func popCurrentScreen(animated: Bool, onCompletion: @escaping () -> Void)
}

extension Wireframe {

    // MARK: - Pop current screen
    func popCurrentScreen() {
        popCurrentScreen(animated: true)
    }

    func popCurrentScreen(onCompletion: @escaping() -> Void) {
        popCurrentScreen(animated: true) { }
    }

    func popCurrentScreen(animated: Bool) {
        popCurrentScreen(animated: animated) { }
    }

    func popCurrentScreen(animated: Bool, onCompletion: @escaping () -> Void) {
        // Pop if there is a Navigation Controller
        if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated, completion: onCompletion)
        } else { // If not, dismiss
            UIApplication.topViewController()?.dismiss(animated: animated, completion: onCompletion)
        }
    }
}

