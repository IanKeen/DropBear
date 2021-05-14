import XCTest

public struct ElementAssertion {
    let name: String
    let assertion: (XCUIElement) -> Bool
    let message: String?

    public init(name: String, message: String? = nil, assertion: @escaping (XCUIElement) -> Bool) {
        self.name = name
        self.assertion = assertion
        self.message = message
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
