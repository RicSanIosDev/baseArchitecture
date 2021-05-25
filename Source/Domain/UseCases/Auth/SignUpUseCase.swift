//
//  SignUpUseCase.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import RxSwift

class SignUpUseCase {
  let authRepo: AuthenticationRepository
  let localRepo: LocalRepository

  init(authRepo: AuthenticationRepository, localRepo: LocalRepository) {
    self.authRepo = authRepo
    self.localRepo = localRepo
  }

  func signUp(user: User) -> Single<Void> {
    return authRepo.signUp(user: user)
  }
}
