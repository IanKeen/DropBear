import XCTest

extension RunningRobot where Context: NavigationControllerContext, Context.NavigationElement: RawRepresentable, Context.NavigationElement.RawValue == String {
    @discardableResult
    public func assert(
        _ element: Context.NavigationElement,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(element, in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ element: Context.NavigationElement,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(element, in: hierarchy, [assertion] + rest, file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ element: Context.NavigationElement,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertions: [ElementAssertion],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        _ = element.element(in: source, hierarchy: hierarchy, file: file, line: line).assert(assertions, file: file, line: line)
        return self
    }
}
