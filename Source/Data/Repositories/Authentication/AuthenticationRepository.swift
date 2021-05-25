//
//  AuthenticationRepository.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import RxSwift

protocol AuthenticationRepository {
    func login(email: String, password: String) -> Single<(token: String, user: User)>
    func signUp(user: User) -> Single<Void>
}

class AuthenticationRepositoryImpl: BaseRepository<AuthenticationTarget>, AuthenticationRepository {

    func login(email: String, password: String) -> Single<(token: String, user: User)> {
        return request(.login(email: email, password: password))
            .filterSuccessfulStatusCodes()
            .map(LoginResponse.self)
            .flatMap({ loginResponse in

                guard let token = loginResponse.data?.token else {
                    return Single.error(DomainError.someError)
                }

                guard let userResposne = loginResponse.data?.user,
                      let filterResponse = loginResponse.data?.filters,
                      let user = UserMappner.map(response: userResposne, filterResponse: filterResponse) else {
                    return Single.error(DomainError.someError)
                }

                return Single.just((token, user))
            })
    }

    func signUp(user: User) -> Single<Void> {
        return Single.just(Void())
    }
}
