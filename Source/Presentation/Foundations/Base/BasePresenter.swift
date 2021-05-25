//
//  BasePresenter.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import RxSwift
import UIKit

class BasePresenter {

  internal weak var baseView: BaseView?
  internal var disposeBag: DisposeBag = DisposeBag()
  internal let schedulers: Schedulers

  var wireframe: Wireframe!

  init(schedulers: Schedulers) {
    self.schedulers = schedulers
  }

  func viewDidLoad() {}
  func viewWillAppear() {}
  func viewDidAppear() {}

  func attachView<T: BaseView>(view: T) {
    self.baseView = view
  }

  internal func handle(error: ErrorType) {
    switch error {
    case .connectionError:
      baseView?.showNativeAlert(title: "Connection Error", message: nil, completion:  nil)
    case .unknown:
      baseView?.showNativeAlert(title: "unknown", message: nil, completion:  nil)
    case .common(let error):
      baseView?.showNativeAlert(title: error.title, message: error.msg, completion:  nil)
    }
  }

  // MARK - Wireframe

  func popCurrentScreen(animated: Bool = true) {
    wireframe.popCurrentScreen(animated: animated)
  }

  func popCurrentScreen(animated: Bool = true, completion: @escaping () -> Void) {
    wireframe.popCurrentScreen(animated: animated, onCompletion: completion)
  }
}



