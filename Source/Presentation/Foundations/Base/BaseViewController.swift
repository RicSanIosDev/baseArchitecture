//
//  BaseViewController.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit
import PKHUD

class BaseViewController<P: BasePresenter>: UIViewController, BaseView {
  typealias Presenter = P

  var presenter: Presenter!

  var singleFingerTap: UITapGestureRecognizer?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.attachView(view: self)
    presenter.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.attachView(view: self)
    presenter.viewWillAppear()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    presenter.viewDidAppear()
  }

  func showLoading() {
    HUD.show(.progress)
  }

  dynamic func showSuccess(completion: ((Bool) -> Void)?){
    HUD.flash(.success, delay: 0.7, completion: completion)
  }

  func hideLoading() {
    HUD.hide()
  }

  func showNativeAlert(title: String, message: String? = nil, completion: ((UIAlertAction) -> Void)?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "alert_button_ok".localized , style: .default, handler: completion))
    present(alert, animated: true, completion: nil)
  }

  // Tap Gesture Recognizer
  func addTapGestureNotification(){
    let selector         = #selector(self.handleBaseSingleTapNotification)
    self.singleFingerTap = UITapGestureRecognizer(target: self, action:selector)
    self.view.addGestureRecognizer(self.singleFingerTap!)
  }

  @objc func handleBaseSingleTapNotification(_ taprecognizer:UITapGestureRecognizer) {
    baseViewTapGesture(taprecognizer)
  }

  // this methods is for to extend
  internal func baseViewTapGesture(_ recognizer: UITapGestureRecognizer){
    self.view.endEditing(true);
    //NSLog("View tap in base");
  }

  func stopGestureRecognizerFromBaseView(){
    self.singleFingerTap?.cancelsTouchesInView = false;
  }

  func restartGestureRecognizerFromBaseView(){
    self.singleFingerTap?.cancelsTouchesInView = true;
  }
}
