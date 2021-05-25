//
//  AuthenticationTarget.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import Moya

enum AuthenticationTarget {
    case login(email: String, password: String)
}

// MARK: - TargetType Protocol Implementation
extension AuthenticationTarget: TargetType {

    var baseURL: URL { return URL(string: EnviromentConfig.shared.baseUrl)! }

    var path: String {
        let path: String
        switch self {
        case .login:
            path = "/auth/login"
        }
        return "\(path)"
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }

    var headers: [String : String]? {
        return nil
    }

    var task: Task {
        switch self {
        case .login(let email, let password):
            var params = RestClientHelper.getParams()
            params["email"] = email
            params["password"] = password
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }

    var sampleData: Data {
        return "Example".data(using: .utf8)!
    }
}

