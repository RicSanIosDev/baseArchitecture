//
//  LogoutUseCase.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

final class LogoutUseCase {
    let localRepo: LocalRepository

    init(localRepo: LocalRepository) {
        self.localRepo = localRepo
    }

    func logout() {
        localRepo.deleteToken()
        localRepo.deleteUser()
    }
}
