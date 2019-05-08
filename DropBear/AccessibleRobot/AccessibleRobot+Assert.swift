import XCTest

extension AccessibleRobot {
    @discardableResult
    public func assert(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(identifier: element.rawValue, in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(identifier: element.rawValue, in: hierarchy, [assertion] + rest, file: file, line: line)
    }
}
