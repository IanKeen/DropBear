//
//  Resetable.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

@propertyWrapper
class Resetable<T> {
    private var factory: () -> T
    private var current: T?

    var wrappedValue: T {
        get {
            let value = current ?? factory()
            current = value
            return value
        }
        set {
            current = newValue
        }
    }
    var projectedValue: Resetable { self }

    func reset() {
        current = nil
    }
    func updateFactory(_ factory: @escaping () -> T) {
        self.factory = factory
    }

    @available(*, unavailable)
    init(wrappedValue: @autoclosure @escaping () -> T?) {
        fatalError()
    }
    init(wrappedValue: @autoclosure @escaping () -> T) {
        factory = wrappedValue
    }
}
