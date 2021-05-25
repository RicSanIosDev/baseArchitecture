//
//  SplashPresenter.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

protocol SplashView: BaseView {}

class SplashPresenter: BasePresenter {
    private var view: SplashView? { return baseView as? SplashView }
    let localRepo: LocalRepository

    init(schedulers: Schedulers, localRepo: LocalRepository) {
        self.localRepo = localRepo
        super.init(schedulers: schedulers)
    }

    override func viewDidAppear() {
        if localRepo.getUser() != nil {
            wireframe.tabBar().replaceAppRootViewController()
//            wireframe.employeeList().show(animated: false)
        } else {
            wireframe.login().replaceAppRootViewController()
        }
//        wireframe.absenceForm(employee: Employee(id: 14,
//                                                 code: "14",
//                                                 firstname: "Jose",
//                                                 lastname: "Garcia",
//                                                 socialNumber: nil,
//                                                 phone: nil,
//                                                 email: nil,
//                                                 supervisor: Supervisor(id: 0, name: "Karen"),
//                                                 departament: nil,
//                                                 position: nil,
//                                                 profession: nil,
//                                                 roles: nil),
//                              absenceTypes: []).show(animated: false)
    }
}
