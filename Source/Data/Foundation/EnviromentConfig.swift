//
//  EnviromentConfig.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

enum NetworkEnvironment {
    case mock
    case development
    case production
}

class EnviromentConfig {

    static let shared: EnviromentConfig = EnviromentConfig()
    let baseUrl = "url"
    init() {}
}
