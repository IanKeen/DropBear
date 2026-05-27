@preconcurrency import XCTest

public struct ElementAssertion: @unchecked Sendable {
    let name: String
    let assertion: @MainActor @Sendable (XCUIElement) -> Bool
    let message: String?

    public init(name: String, message: String? = nil, assertion: @escaping @MainActor @Sendable (XCUIElement) -> Bool) {
        self.name = name
        self.assertion = assertion
        self.message = message
    }

    /// Evaluates the assertion against `element` and returns the result without
    /// failing the test. Use this to branch on UI state; use `XCUIElement.assert`
    /// / `Robot.assert` when a false result should fail the test.
    @MainActor
    public func evaluate(_ element: XCUIElement) -> Bool {
        assertion(element)
    }
}

public prefix func !(assertion: ElementAssertion) -> ElementAssertion {
    return .init(name: "!\(assertion.name)", assertion: { element in
        return !assertion.assertion(element)
    })
}

public func &&(lhs: ElementAssertion, rhs: ElementAssertion) -> ElementAssertion {
    return .init(name: "(\(lhs.name) && \(rhs.name))", assertion: { element in
        return lhs.assertion(element) && rhs.assertion(element)
    })
}

public func ||(lhs: ElementAssertion, rhs: ElementAssertion) -> ElementAssertion {
    return .init(name: "(\(lhs.name) || \(rhs.name))", assertion: { element in
        return lhs.assertion(element) || rhs.assertion(element)
    })
}
