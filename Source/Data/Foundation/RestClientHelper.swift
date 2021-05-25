//
//  RestClientHelper.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import Moya

// MARK: - Rest Client Helper

class RestClientHelper {

    static func getProviderPugins() -> [PluginType] {
        return [getLoggerPlugin()]
    }

    static func getLoggerPlugin() -> PluginType {
        return LoggerPlugin()
    }

    static func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)

            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }

    // MARK: Params

    static func getParams(initials: [String: Any]? = nil) -> [String: Any] {
        var params: [String: Any] = [:]
        if initials != nil {
            initials!.forEach { (key, value) in params[key] = value }
        }
        return params
    }

    static func getMultipartBodyFrom(parameters: [String: Any]) -> [MultipartFormData] {
        var multiparts: [MultipartFormData] = []
        parameters.forEach { (key, value) in
            let multipart = MultipartFormData(provider: .data(String(describing: value).data(using: .utf8)!), name: key)
            multiparts.append(multipart)
        }

        return multiparts
    }
}
