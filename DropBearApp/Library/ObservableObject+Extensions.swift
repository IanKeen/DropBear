//
//  ObservableObject+Extensions.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import Foundation

extension ObservableObject {
    var objectDidChange: AnyPublisher<ObjectWillChangePublisher.Output, ObjectWillChangePublisher.Failure> {
        return objectWillChange.debounce(for: 0.1, scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
}
