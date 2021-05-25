//
//  APIProvider.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Moya
import RxSwift

class APIProvider<T: TargetType> {
    internal var provider: MoyaProvider<T>
    internal let schedulers: Schedulers

    init(schedulers: Schedulers) {
        self.schedulers = schedulers

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.httpCookieStorage = HTTPCookieStorage.shared
        sessionConfig.httpCookieAcceptPolicy = .always
        sessionConfig.httpShouldSetCookies = true

        let session = Moya.Session(configuration: sessionConfig)

        let endpointClosure = { (target: T) -> Endpoint in
            let url: String = "\(target.baseURL.absoluteString)\(target.path)"

            let endpoint = Endpoint(
                url: url,
                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )

            return endpoint
        }

        provider = MoyaProvider(endpointClosure: endpointClosure,
                                session: session,
                                plugins: RestClientHelper.getProviderPugins())
    }

    func request(_ target: T) -> Single<Response> {
        return provider.rx.request(target)
            .bgThread(schedulers: schedulers)
    }
}
