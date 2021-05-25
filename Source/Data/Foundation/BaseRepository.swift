//
//  BaseRepository.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import Moya
import RxSwift

class BaseRepository<T: TargetType> {

  let provider: APIProvider<T>

  init(provider: APIProvider<T>) {
    self.provider = provider
  }

  func request(_ target: T) -> Single<Response> {
    return provider.request(target)
  }
}
