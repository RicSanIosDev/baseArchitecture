//
//  Schedulers.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import RxSwift
import Moya

struct Schedulers {

    var mainThread = MainScheduler.instance
    var bgThread: SchedulerType {
        return SerialDispatchQueueScheduler(qos: .background)
    }
}

extension PrimitiveSequence where Trait == SingleTrait {

    func applySchedulers(schedulers: Schedulers) -> Single<Element> {
        return self.subscribeOn(schedulers.bgThread)
            .observeOn(schedulers.mainThread)
    }

    func bgThread(schedulers: Schedulers) -> Single<Element> {
        return self.observeOn(schedulers.bgThread)
    }
}

extension Observable {

    func applySchedulers(schedulers: Schedulers) -> Observable<Element> {
        return self.subscribeOn(schedulers.bgThread)
            .observeOn(schedulers.mainThread)
    }

    func bgThread(schedulers: Schedulers) -> Observable<Element> {
        return self.observeOn(schedulers.bgThread)
    }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Moya.Response {

    func handleError() -> Single<Response> {
        return self.flatMap { (response: Response) -> Single<Response> in
            do {
                let filteredResponse = try response.filterSuccessfulStatusCodes()
                return Single.just(filteredResponse)
            } catch {
                let error = String(data: response.data, encoding: .utf8)! // swiftlint:disable:this force_cast
                return Single.error(NSError(domain: error, code: response.statusCode, userInfo: nil))
            }
        }
    }
}

