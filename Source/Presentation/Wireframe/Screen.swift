//
//  Screen.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

class Screen {
    private let viewController: UIViewController
    private let isModal: Bool

    init(viewController: UIViewController, isModal: Bool = false) {
        self.viewController = viewController
        self.isModal = isModal
    }

    func get() -> UIViewController {
        return viewController
    }

    func show(animated: Bool = true, presentation style: UIModalPresentationStyle = .fullScreen) {
        if isModal {
            presentViewController(viewController, presentationStyle: style , animated: animated)
        } else {
            pushViewController(viewController, presentationStyle: style, animated: animated)
        }
    }

    func replaceAppRootViewController() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
              let window = sceneDelegate.window else {
            return
        }

        // Simulate the correct view lifecycle
        window.rootViewController?.viewWillDisappear(false)
        window.rootViewController?.viewDidDisappear(false)
        window.rootViewController?.dismiss(animated: false, completion: nil)

        // Change rootViewController
        window.rootViewController = viewController

        // Animation! (Using a snapshot of the previous root view controller)
        guard let snapshot = window.snapshotView(afterScreenUpdates: false) else {
            return
        }

        window.rootViewController?.view.addSubview(snapshot)

        UIView.animate(withDuration: 0.3, animations: {
            snapshot.layer.opacity = 0
            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        }, completion: { _ in
            snapshot.removeFromSuperview()
        })
    }

    // MARK: - Present Methods

    private func presentViewController(_ viewController: UIViewController,
                                       presentationStyle: UIModalPresentationStyle = .fullScreen,
                                       animated: Bool) {
        viewController.modalPresentationStyle = presentationStyle
        UIApplication.topViewController()?.present(viewController, animated: animated, completion: nil)
    }

    // MARK: - Push Methods

    private func pushViewController(_ viewController: UIViewController,
                                    presentationStyle: UIModalPresentationStyle,
                                    animated: Bool) {
        var viewController = viewController
        // Push if there is a Navigation Controller
        if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController {
            // Get the last VC if it is inside of a stack
            if let viewControllerNVC = viewController as? UINavigationController,
                let lastViewController = viewControllerNVC.viewControllers.last {
                viewController = lastViewController
            }
            navigationController.pushViewController(viewController, animated: animated)
        } else { // If not, Present
            presentViewController(viewController, presentationStyle: presentationStyle, animated: animated)
        }
    }
}

