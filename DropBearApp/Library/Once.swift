//
//  Once.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

@propertyWrapper
class Once<T>: ExpressibleByNilLiteral {
    private var _value: T?

    init() { }
    required init(nilLiteral: ()) { }

    var wrappedValue: T? {
        get { defer { _value = nil }; return _value }
        set { _value = newValue }
    }
}
