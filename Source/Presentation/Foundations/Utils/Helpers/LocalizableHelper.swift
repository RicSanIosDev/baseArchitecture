//
//  LocalizableHelper.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

enum SupportedLanguage: String, CaseIterable {
    case english = "en"
    case spanish = "es"
}

final class LocalizableHelper {

    static let shared: LocalizableHelper = LocalizableHelper()

    private var localeDic: [String: String] = [:]
    var selectedLanguage: SupportedLanguage = .english

    init() {
        readStrings(language: .english)
    }

    func locale(key: String) -> String {
        return localeDic[key] ?? key
    }

    func readStrings(language: SupportedLanguage) {
        selectedLanguage = language
        let fileName = "strings_\(language.rawValue)"
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
            let dic = jsonResult as? [String: String] else {
                return
        }

        localeDic = dic
    }
}

