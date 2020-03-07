import XCTest

extension Robot where Self: Actionable {
    public func type(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        text: String,
        tapFirst: Bool = true,
        clearFirst: Bool = true,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let element = element.element(in: app, hierarchy: hierarchy, file: file, line: line)
        if tapFirst { element.tap() }
        if clearFirst { element.clearText(file: file, line: line) }
        element.typeText(text)

        return self
    }

    public func clearText(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element
            .element(in: app, hierarchy: hierarchy, file: file, line: line)
            .clearText(file: file, line: line)

        return self
    }
}
