//
//  LoggerPlugin.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Moya

private struct Logger {

    enum LoggerType {
        case debug
        case verbose
        case none
    }

    static let typeSelected: LoggerType = .verbose

    static func debug(_ text: String) {
        switch typeSelected {
        case .debug, .verbose:
            print(text)
        case .none:
            break
        }
    }

    static func verbose(_ text: String) {
        switch typeSelected {
        case .verbose:
            print(text)
        case .none, .debug:
            break
        }

    }
}

class LoggerPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        guard let request = request.request else { return }
        let separatorString = "\n===============================\n"
        var message = separatorString + "METHOD: \(target.method.rawValue.uppercased()) \nPATH: \(target.path)"
        var body = ""

        if let request = request.urlRequest {

            if let url = request.url?.absoluteString {
                message += "\nURL: \(url)"
            }

            if let headers = request.allHTTPHeaderFields {
                message += "\nHeaders: \(headers.description)"
            }

            if let params = request.url?.query?.description {
                message += "\nPARAMS: \(params)"
            }

            message += separatorString

            if let data = request.httpBody,
                let stringData = String(data: LoggerPlugin.JSONResponseDataFormatter(data),
                                        encoding: .utf8)?.removingPercentEncoding {
                body = separatorString + "\nREQUEST:\n\(stringData)" + separatorString
            }
        }

        Logger.debug(message)
        if !body.isEmpty {
            Logger.debug(body)
        }
    }

    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        let successSeparator = "\n ✅✅ ================%@================ ✅✅ \n"
        let errorSeparator = "\n 🔴🔴 =============================== 🔴🔴  \n"
        switch result {
        case .success(let response):
            let separatorResponse = String(format: successSeparator, arguments: [" Response "])
            let separatorBottom = String(format: successSeparator, arguments: ["=========="])

            let debugString = "\n\t\t\(target.method.rawValue.uppercased()) \(target.path) \n\t\tstatus code - \(response.statusCode)\n"

            if let response = try? response.filterSuccessfulStatusCodes(),
                let stringData = String(data: LoggerPlugin.JSONResponseDataFormatter(response.data), encoding: String.Encoding.utf8) {
                let separatorString2 = "\n      ================%@===========  \n"
                let separatorBody = String(format: separatorString2, arguments: [" Body Response "])
                Logger.verbose(separatorResponse + debugString + separatorBody + "\(stringData)" + separatorBottom)
            } else {
                let stringData = String(data: LoggerPlugin.JSONResponseDataFormatter(response.data), encoding: String.Encoding.utf8) ?? ""
                Logger.debug( errorSeparator + debugString + "\n\(stringData)" + errorSeparator)
            }
        case .failure(let error):
            let statusCode = "Status code: \(error.response?.statusCode ?? 0)\n"
            Logger.debug( errorSeparator + statusCode + "\(target.method.rawValue.uppercased()) \(target.path) ERROR response: \(error.errorDescription ?? "ERROR_NEED_TO_DEBUG")" + errorSeparator)
        }
    }

    private static func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)

            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }
}
