@preconcurrency import XCTest

extension Robot {
    /// Resolves the `XCUIElement` for an element key against this robot's `source`.
    /// The fluent `tap`/`assert` helpers cover most needs; reach for this when you
    /// need the raw element — e.g. to scope a further query or read a property.
    public func element(
        _ key: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #filePath, line: UInt = #line
        ) -> XCUIElement
    {
        return key.element(in: source, hierarchy: hierarchy, file: file, line: line)
    }

    /// Resolves a descendant of `source` of `type` whose identifier begins with
    /// `idPrefix`.
    public func element(
        idPrefix: String,
        type: XCUIElement.ElementType = .any,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int = 0,
        file: StaticString = #filePath, line: UInt = #line
        ) -> XCUIElement
    {
        return source.element(idPrefix: idPrefix, type: type, in: hierarchy, index: index, file: file, line: line)
    }

    /// Resolves a descendant of `source` of `type` whose label/value/title
    /// contains `text` (case-insensitive).
    public func element(
        containingText text: String,
        type: XCUIElement.ElementType = .any,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int = 0,
        file: StaticString = #filePath, line: UInt = #line
        ) -> XCUIElement
    {
        return source.element(containingText: text, type: type, in: hierarchy, index: index, file: file, line: line)
    }
}

extension Robot where Self: Actionable {
    /// Taps a descendant whose identifier begins with `idPrefix`.
    @discardableResult
    public func tap(
        idPrefix: String,
        type: XCUIElement.ElementType = .button,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int = 0,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        element(idPrefix: idPrefix, type: type, in: hierarchy, index: index, file: file, line: line).tap()
        return self
    }

    /// Taps a descendant whose label/value/title contains `text`.
    @discardableResult
    public func tap(
        containingText text: String,
        type: XCUIElement.ElementType = .button,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int = 0,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        element(containingText: text, type: type, in: hierarchy, index: index, file: file, line: line).tap()
        return self
    }
}
