import XCTest

extension RunningRobot {
    @discardableResult
    public func tap(
        _ element: ContextElement<Context>,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return tap(element, in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func tap(
        _ element: ContextElement<Context>,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return tap(element, in: hierarchy, [assertion] + rest, file: file, line: line)
    }

    @discardableResult
    public func tap(
        _ element: ContextElement<Context>,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertions: [ElementAssertion],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element.element(source).assert(.exists, file: file, line: line).tap()
        return self
    }
}
