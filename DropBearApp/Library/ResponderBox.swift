//
//  ResponderBox.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

public class ResponderBox: NSObject {

    // MARK: - Private Properties
    @nonobjc private let _value: Any

    // MARK: - Lifecycle
    @nonobjc public init<T>(_ value: T) {
        self._value = value
        super.init()
    }

    // MARK: - Public Properties
    @nonobjc public func value<T>(_: T.Type = T.self) -> T {
        guard let value = _value as? T else {
            fatalError("Invalid value. Expected \(T.self), found \(type(of: _value))")
        }

        return value
    }
}
