//
//  Single+Extensions.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import RxSwift
import Moya

struct BaseError: Codable {
    let message: String
    var code: Int = 0
}

enum ErrorType: Error {
    case common(errorMsg:(title: String, msg: String?))
    case connectionError
    case unknown
}

enum NetworkError: Int {
    case notFound = 404
    case forbidden = 403
    case serverError = 500
}


extension PrimitiveSequence where Trait == SingleTrait {

    func loading(view: BaseView?) -> Single<Element> {
        view?.showLoading()
        return self.do(onSuccess: { _ in view?.hideLoading()},
                       onError: { _ in view?.hideLoading()})
    }

    func handleError(presenter: BasePresenter) -> Single<Element> {
        return self.do(onError: { error in
            switch error {
            case let moyaError as MoyaError:
                self.handleMoyaError(moyaError, presenter: presenter)
            default:
                presenter.handle(error: .unknown)
                return
            }
        })
    }

    private func handleMoyaError(_ moyaError: MoyaError, presenter: BasePresenter) {
        guard case .statusCode(let response) = moyaError else {
            print("No hay conexion")
            presenter.handle(error: .connectionError)
            return
        }

        guard let error = NetworkError(rawValue: response.statusCode) else {
            presenter.handle(error: .unknown)
            return
        }

        let msg = (try? response.mapString(atKeyPath: "message")) ?? ""
        switch error {
        case .notFound:
            presenter.handle(error: .common(errorMsg: ("Error","Not Found")))
        case .forbidden:
            presenter.handle(error: .common(errorMsg: ("Error",msg)))
        case .serverError:
            presenter.handle(error: .common(errorMsg: ("Server Error", moyaError.errorDescription)))
        }
    }
}


