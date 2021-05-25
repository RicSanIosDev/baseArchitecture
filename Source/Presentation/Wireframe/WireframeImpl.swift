//
//  WireframeImpl.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

class WireframeImpl: Wireframe {

    // MARK: - Splash

    func splash() -> Screen {
        let vc = SplashViewController.instantiate()
        return Screen(viewController: vc)
    }

    // MARK: - TabBar

    func tabBar() -> Screen {
        let imageConfig = UIImage.SymbolConfiguration(scale: .large)

        // MARK: ActionList
        let primaryVC = primaryView().get()
        let imageActionsList = UIImage(systemName: "plus.app.fill")
        primaryVC.tabBarItem = UITabBarItem(title: nil, image: imageActionsList, tag: 0)


        // MARK: Settings
        let settingsVC = settings().get()
        let imageSetting = UIImage(systemName: "gear", withConfiguration: imageConfig)
        settingsVC.tabBarItem = UITabBarItem(title: nil, image: imageSetting, tag: 1)

        let tabVC = TabBarViewController(vcs: [primaryVC, settingsVC])
        return Screen(viewController: tabVC)
    }

    // MARK: - Settings

    func settings() -> Screen {
        let vc = SettingsViewController.instantiate()
        vc.navigationItem.title = "Settings"
        let nav = UINavigationController(rootViewController: vc)
        return Screen(viewController: nav)
    }

    // MARK: - ActionsList

    func primaryView() -> Screen {
        let vc = PrimaryViewController.instantiate()
        let nav = UINavigationController(rootViewController: vc)
        return Screen(viewController: nav)
    }

    // MARK: - Login

    func login() -> Screen {
        let vc = LoginViewController.instantiate()
        return Screen(viewController: vc)
    }
}

