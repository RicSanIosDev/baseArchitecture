//
//  User.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

struct User: Codable {
    var id: Int
    var employeeId: Int
    var name: String
    var email: String
    var departament: String
    var filter: String
}

struct FilterUser: Codable {
    var id: Int
    var site: String
    var area: String
    var departament: String
}

struct Departament: Codable {
    var id: Int?
    var code: String?
    var description: String?
}
