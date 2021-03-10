//
//  Input.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-07.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine

@propertyWrapper
struct Input<T> {
    private let subject = PassthroughSubject<T, Never>()
    private var _send: (T) -> Void

    init() {
        self.publisher = subject.eraseToAnyPublisher()
        self._send = subject.send
    }

    func send(_ value: T) {
        _send(value)
    }

    let publisher: AnyPublisher<T, Never>

    var wrappedValue: T {
        get { fatalError("Inputs are write only") }
        set { fatalError("Inputs should only be written to via the $projectedValue.send") }
    }

    struct SendProxy {
        private let send: (T) -> Void

        fileprivate init(_ send: @escaping (T) -> Void) {
            self.send = send
        }

        func callAsFunction(_ value: T) {
            send(value)
        }
    }

    var projectedValue: SendProxy { .init(subject.send) }
}

extension Input.SendProxy where T == Void {
    func callAsFunction() {
        callAsFunction(())
    }
}

extension Input where T == Void {
    func send() { self.send(()) }
}

extension Input {
    mutating func assign(to input: Input.SendProxy) {
        _send = input.callAsFunction
    }
}
