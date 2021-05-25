//
//  SplashViewController.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

class SplashViewController: BaseViewController<SplashPresenter>{
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    view.backgroundColor = .white
  }
}

extension SplashViewController: SplashView {}
