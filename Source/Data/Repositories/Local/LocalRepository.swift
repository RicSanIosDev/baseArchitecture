//
//  LocalRepository.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

struct LocalKeys {
    static let token = "access_token"
    static let user = "user_key"
}

class LocalRepository {

    let userDefaults = UserDefaults.standard

    // MARK: - Token

    func saveToken(token: String) {
        userDefaults.set(token, forKey: LocalKeys.token)
    }

    static func getToken() -> String? {
        guard let token = UserDefaults.standard.object(forKey: LocalKeys.token) as? String, !token.isEmpty else {
            return nil
        }

        return token
    }

    func deleteToken() {
        userDefaults.removeObject(forKey: LocalKeys.token)
    }

    // MARK: - User

    func save(user: User) {
        userDefaults.set(user.data, forKey: LocalKeys.user)
    }

    func getUser() -> User? {
        guard let data = userDefaults.data(forKey: LocalKeys.user) else {
            return nil
        }
        return try? JSONDecoder().decode(User.self, from: data)
    }

    func deleteUser() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: LocalKeys.user)
    }
}

