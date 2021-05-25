//
//  String+Localizable.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

extension String {

    var localized: String {
        return LocalizableHelper.shared.locale(key: self)
    }

    func locale() -> String {
        return NSLocalizedString(self, comment: "")
    }

    func locale(withComment comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }

    func locale(inTableName tableName: String, withComment comment: String) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: comment)
    }
}
