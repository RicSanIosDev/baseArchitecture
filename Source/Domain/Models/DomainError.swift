//
//  DomainError.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

public enum DomainError: Error, Equatable {
    case notConnectedToInternet // URLError returned when request fails because of internet connection problem
    case timedOut // when request takes too long
    case emptyData // use manually when you want to handle empty data as an error
    case mapError
    case someError // use manually when you don't care about the exact error. Simplifies code because `==` is simpler (no associated values). // swiftlint:disable:this line_length
    case error(message: String?) // used by DomainErrorMapper when error's code is not part of URLError.Code
}

public func == (lhs: DomainError, rhs: DomainError) -> Bool {
    switch (lhs, rhs) {
    case (.notConnectedToInternet, .notConnectedToInternet),
         (.timedOut, .timedOut),
         (.mapError, .mapError),
         (.emptyData, .emptyData),
         (.someError, .someError):
        return true

    case (.error(let messageA), .error(let messageB)):
        return messageA == messageB

    default:
        return false
    }
}
