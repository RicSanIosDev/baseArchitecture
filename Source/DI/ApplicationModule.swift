//
//  ApplicationModule.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import Swinject

final class DependecyInjection {

    static let shared: DependecyInjection = DependecyInjection()

    let container: Container = {
        let container = Container()
        DataModule.setup(container)
        ViewModule.setup(container)
        return container
    }()

    func instantiate<T>(type: T.Type) -> T {
        return container.resolve(type)!
    }
}
