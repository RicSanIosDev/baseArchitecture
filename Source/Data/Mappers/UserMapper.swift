//
//  UserMapper.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

final class UserMappner {
    static func map(response: UserResponse, filterResponse: FiltersResponse) -> User? {
        guard let id = response.id else {
            return nil
        }
//              let employeeId = response.idEmployes,
//              let email = response.email,
//              let filter = map(response: filterResponse, userResponse: response),
//              let departament = map(response: response)

//        let name = "\(response.firstname ?? "") \(response.lastname ?? "")"
        return User(id: id,
                    employeeId: 0,
                    name: "name",
                    email: "email",
                    departament: "departament",
                    filter: "filter")
    }

    private static func map(response: FiltersResponse, userResponse: UserResponse) -> FilterUser? {

        guard response.all != 1 else {
            return FilterUser(id: response.idFilter ?? 0,
                              site: "",
                              area: "",
                              departament: "")
        }

//        let site = response.site == 1 ? userResponse.siteID?.description ?? "" : ""
//        let area = response.area == 1 ? userResponse.areaid?.description ?? "" : ""
//        let departament = response.departament == 1 ? userResponse.departamentid?.description ?? "" : ""

        return FilterUser(id: response.idFilter ?? 0,
                          site: "site",
                          area: "area",
                          departament: "departament")
    }

    private static func map(response: UserResponse) -> Departament? {
        guard let id = response.id else {
            return nil
        }
        return Departament(id: id, code: "", description: "response.descriptionDepartament")
    }
}
