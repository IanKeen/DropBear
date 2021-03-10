//
//  ElementAssertion.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

public struct ElementAssertion {
    public enum Result: Equatable {
        case success(String)
        case failure(String)
    }

    public let name: String
    public let assert: (XCUIElement) -> Result

    public init(name: String, assert: @escaping (XCUIElement) -> Result) {
        self.name = name
        self.assert = assert
    }
}

extension ElementAssertion {
    public static var always: ElementAssertion {
        return .init(name: "always", assert: { _ in .success("Always succeeds") })
    }
    public static var never: ElementAssertion {
        return .init(name: "never", assert: { _ in .failure("Never succeeds") })
    }
}

public prefix func !(assertion: ElementAssertion) -> ElementAssertion {
    return .init(name: "!\(assertion.name)", assert: { element in
        switch assertion.assert(element) {
        case .success(let value):
            return .failure(value)
        case .failure(let value):
            return .success(value)
        }
    })
}

public func &&(lhs: ElementAssertion, rhs: ElementAssertion) -> ElementAssertion {
    return .init(name: "(\(lhs.name) && \(rhs.name))", assert: { element in
        switch lhs.assert(element) {
        case .success:
            return rhs.assert(element)

        case .failure(let error):
            return .failure(error)
        }
    })
}

public func ||(lhs: ElementAssertion, rhs: ElementAssertion) -> ElementAssertion {
    return .init(name: "(\(lhs.name) || \(rhs.name))", assert: { element in
        switch lhs.assert(element) {
        case .success(let value):
            return .success(value)

        case .failure(let lhsError):
            switch rhs.assert(element) {
            case .success(let value):
                return .success(value)

            case .failure(let rhsError):
                return .failure("Multiple failures: '\(lhsError)' && '\(rhsError)'")
            }
        }
    })
}
