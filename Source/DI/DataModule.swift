//
//  DataModule.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import Swinject

class DataModule {

    static func setup(_ defaultContainer: Container) {
        defaultContainer.register(Schedulers.self) { _ in
            Schedulers()
        }.inObjectScope(.container)

        resolveRepositories(defaultContainer)
        resolveUseCase(defaultContainer)
    }

    static func resolveRepositories(_ defaultContainer: Container) {
        func getAPIProvider<T>() -> APIProvider<T> {
            return APIProvider(schedulers: defaultContainer.resolve(Schedulers.self)!)
        }

        defaultContainer.register(LocalRepository.self) { _ in
            LocalRepository()
        }.inObjectScope(.container)

        defaultContainer.register(AuthenticationRepository.self) { r in
            AuthenticationRepositoryImpl(provider: getAPIProvider())
        }

    }

    static func resolveUseCase(_ defaultContainer: Container) {
        defaultContainer.register(LoginUseCase.self) { r in
            LoginUseCase(authRepo: r.resolve(AuthenticationRepository.self)!,
                         localRepo: r.resolve(LocalRepository.self)!)
        }

        defaultContainer.register(SignUpUseCase.self) { r in
            SignUpUseCase(authRepo: r.resolve(AuthenticationRepository.self)!,
                          localRepo: r.resolve(LocalRepository.self)!)
        }

        defaultContainer.register(LogoutUseCase.self) { r in
            LogoutUseCase(localRepo: r.resolve(LocalRepository.self)!)
        }

    }
}

