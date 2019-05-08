import XCTest

extension Robot {
    @discardableResult
    public func assert(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(identifier: identifier, in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(identifier: identifier, in: hierarchy, [assertion] + rest, file: file, line: line)
    }

    func assert(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertions: [ElementAssertion],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let element = self.element(identifier: identifier, in: hierarchy, file: file, line: line)
        _ = element.assert(assertions, file: file, line: line)
        return self
    }
}
