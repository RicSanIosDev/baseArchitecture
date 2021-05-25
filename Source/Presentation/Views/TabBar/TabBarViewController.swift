//
//  TabBarViewController.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    init(vcs: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = vcs
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setup() {
        tabBar.barTintColor = UIColor.TabBar.background
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = UIColor.TabBar.selectedItem
        tabBar.isTranslucent = false
    }
}
