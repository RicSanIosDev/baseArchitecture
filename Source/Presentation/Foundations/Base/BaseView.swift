//
//  BaseView.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import UIKit

@objc protocol BaseView: class {
    func showLoading()
    func showSuccess(completion: ((Bool) -> Void)?)
    func hideLoading()

    func showNativeAlert(title: String, message: String?, completion: ((UIAlertAction) -> Void)?)
}

