@preconcurrency import XCTest

public protocol Assertable { }

extension Robot where Self: Assertable {
    @discardableResult
    public func assert(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        return assert(element, in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        return assert(element, in: hierarchy, [assertion] + rest, file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertions: [ElementAssertion],
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        element
            .element(in: source, hierarchy: hierarchy, file: file, line: line)
            .assert(assertions, file: file, line: line)

        return self
    }

    @discardableResult
    public func assert(
        _ elements: [Element],
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        return assert(elements, in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ elements: [Element],
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        return assert(elements, in: hierarchy, [assertion] + rest, file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ elements: [Element],
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertions: [ElementAssertion],
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        let allElements = elements.map { $0.element(in: source, hierarchy: hierarchy, file: file, line: line) }

        for element in allElements {
            element.assert(assertions, file: file, line: line)
        }

        return self
    }

    /// Non-failing counterpart to `assert`: resolves `element` and returns
    /// whether `assertion` holds, without failing the test. Use to branch on UI
    /// state (e.g. retry / skip flows) where `assert` would abort the test.
    public func matches(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        _ assertion: ElementAssertion,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Bool
    {
        return assertion.evaluate(
            element.element(in: source, hierarchy: hierarchy, file: file, line: line)
        )
    }
}
