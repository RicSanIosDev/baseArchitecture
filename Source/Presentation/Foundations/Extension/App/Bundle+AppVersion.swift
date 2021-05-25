//
//  Bundle+AppVersion.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

extension Bundle {
    var versionNumber: String {
         (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    var buildNumber: String {
         (infoDictionary?["CFBundleVersion"] as? String) ?? ""
    }
}
