import XCTest

public struct ContextElement<Context: RobotContext> {
    let element: (XCUIApplication) -> XCUIElement

    public init(element: @escaping (XCUIApplication) -> XCUIElement) {
        self.element = element
    }
}

extension RunningRobot {
    @discardableResult
    public func assert(
        _ element: ContextElement<Context>,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(element, in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ element: ContextElement<Context>,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(element, in: hierarchy, [assertion] + rest, file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ element: ContextElement<Context>,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertions: [ElementAssertion],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        _ = element.element(app).assert(assertions, file: file, line: line)
        return self
    }
}
