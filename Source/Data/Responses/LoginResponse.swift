//
//  LoginResponse.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let status: String?
    let data: LoginDataResponse?
    let title: String?
    let msg: String?
    let code: Int?
    let accion: String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case title = "title"
        case msg = "msg"
        case code = "code"
        case accion = "accion"
    }
}

// MARK: - DataClass
struct LoginDataResponse: Codable {
    let token: String?
    let user: UserResponse?
    let filters: FiltersResponse?

    enum CodingKeys: String, CodingKey {
        case token = "token"
        case user = "user"
        case filters = "filters"
    }
}

// MARK: - Filters
struct FiltersResponse: Codable {
    let departament: Int?
    let all: Int?
    let idFilter: Int?
    let site: Int?
    let area: Int?

    enum CodingKeys: String, CodingKey {
        case departament = "departament"
        case all = "all"
        case idFilter = "id_filter"
        case site = "site"
        case area = "area"
    }
}

// MARK: - User
struct UserResponse: Codable {
    let id: Int?
    let name: String?
}
