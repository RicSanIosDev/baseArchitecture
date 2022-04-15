//
//  LoginPresenter.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

protocol LoginView: BaseView {}

class LoginPresenter: BasePresenter {

    private var view: LoginView? { return baseView as? LoginView }
    private let loginUseCase: LoginUseCase

    init(schedulers: Schedulers, loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
        super.init(schedulers: schedulers)
    }

    func login(email: String, password: String) {
        loginUseCase.login(email: email, password: password)
            .applySchedulers(schedulers: schedulers)
            .loading(view: view)
            .handleError(presenter: self)
            .subscribe(onSuccess: { [wireframe] _ in
                wireframe?.tabBar().replaceAppRootViewController()
            }).disposed(by: disposeBag)
    }
    //test login view
    func loginTest(email: String, password: String) {
        wireframe?.tabBar().replaceAppRootViewController()
    }
}

