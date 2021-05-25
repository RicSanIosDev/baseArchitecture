//
//  LoginUseCase.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import RxSwift

class LoginUseCase {

    let authRepo: AuthenticationRepository
    let localRepo: LocalRepository

    init(authRepo: AuthenticationRepository, localRepo: LocalRepository) {
        self.authRepo = authRepo
        self.localRepo = localRepo
    }

    func login(email: String, password: String) -> Single<User> {
        return authRepo.login(email: email, password: password)
            .map { [weak localRepo] result in
                localRepo?.saveToken(token: result.token)
                localRepo?.save(user: result.user)
                return result.user
            }
    }
}
