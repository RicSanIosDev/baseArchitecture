//
//  ViewModule.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import Swinject

class ViewModule {
    static func setup(_ defaultContainer: Container) {

        defaultContainer.register(Wireframe.self) { _ in
            WireframeImpl()
        }.inObjectScope(.container)

        resolvePresenters(defaultContainer)
        resolveViewControllers(defaultContainer)
    }

    // MARK: - Presenters

    static func resolvePresenters(_ defaultContainer: Container) {

        defaultContainer.register(BasePresenter.self) { r in
            BasePresenter(schedulers: r.resolve(Schedulers.self)!)
        }

        //MARK:  Splash

        defaultContainer.register(SplashPresenter.self) { r in
            SplashPresenter(schedulers: r.resolve(Schedulers.self)!,
                            localRepo: r.resolve(LocalRepository.self)!)
        }

        //MARK: Authentication


        //MARK: LanguageSelector


        //MARK: Authentication

        defaultContainer.register(LoginPresenter.self) { r in
            LoginPresenter(schedulers: r.resolve(Schedulers.self)!,
                           loginUseCase: r.resolve(LoginUseCase.self)!)
        }

        
        defaultContainer.register(SettingsPresenter.self) { r in
            SettingsPresenter(schedulers: r.resolve(Schedulers.self)!, logoutUseCase: r.resolve(LogoutUseCase.self)!)
        }


    }

    // MARK: - ViewControllers

    static func resolveViewControllers(_ defaultContainer: Container) {
        // To make your life easier
        func register<P, V: BaseViewController<P>>(vc: V.Type) {
            defaultContainer.register(vc) { r in
                let instantiateVC = vc.init()
                instantiateVC.presenter = r.resolve(V.Presenter.self)!
                instantiateVC.presenter.wireframe = r.resolve(Wireframe.self)!
                return instantiateVC
            }
        }

        // MARK: Splash
        register(vc: SplashViewController.self)

        // MARK: Settings
        register(vc: SettingsViewController.self)

        // MARK: primatyView
        register(vc: PrimaryViewController.self)

        // MARK: Auth
        register(vc: LoginViewController.self)

    }
}

