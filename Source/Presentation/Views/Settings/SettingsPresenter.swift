//
//  SettingsPresenter.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

protocol SettingsView: BaseView {}

class SettingsPresenter: BasePresenter {
    private var view: SettingsView? { return baseView as? SettingsView }
    private let logoutUseCase: LogoutUseCase

    init(schedulers: Schedulers,
         logoutUseCase: LogoutUseCase) {
        self.logoutUseCase = logoutUseCase
        super.init(schedulers: schedulers)
    }

    func logout() {
        logoutUseCase.logout()
        wireframe.login().replaceAppRootViewController()
    }
}
