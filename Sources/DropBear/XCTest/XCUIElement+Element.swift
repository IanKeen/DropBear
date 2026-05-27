@preconcurrency import XCTest

extension XCUIElement {
    public func element(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #filePath, function: String = #function, line: UInt = #line
        ) -> XCUIElement
    {
        guard let first = hierarchy.first else {
            XCTFail("At least one hierarchy element must be provided", file: file, line: line)
            return firstMatch
        }

        let root = descendants(matching: first)
        let container = hierarchy.dropFirst().reduce(root) { $0.descendants(matching: $1) }
        return container.element(matching: .any, identifier: identifier)
    }

    /// Resolves a descendant of `type` whose accessibility identifier begins with
    /// `idPrefix`. Useful for data-driven ids with a stable prefix and a dynamic
    /// suffix (e.g. `"ProductListCard-<id>"`).
    public func element(
        idPrefix: String,
        type: XCUIElement.ElementType = .any,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int = 0,
        file: StaticString = #filePath, line: UInt = #line
        ) -> XCUIElement
    {
        return query(of: type, in: hierarchy, file: file, line: line)
            .matching(NSPredicate(format: "identifier BEGINSWITH %@", idPrefix))
            .element(boundBy: index)
    }

    /// Resolves a descendant of `type` whose label, value, or title contains
    /// `text` (case-insensitive). Useful for selecting a row by its visible text
    /// when it has no stable identifier.
    public func element(
        containingText text: String,
        type: XCUIElement.ElementType = .any,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int = 0,
        file: StaticString = #filePath, line: UInt = #line
        ) -> XCUIElement
    {
        let predicate = NSPredicate(
            format: "label CONTAINS[c] %@ OR value CONTAINS[c] %@ OR title CONTAINS[c] %@",
            text, text, text
        )
        return query(of: type, in: hierarchy, file: file, line: line)
            .matching(predicate)
            .element(boundBy: index)
    }

    private func query(
        of type: XCUIElement.ElementType,
        in hierarchy: [XCUIElement.ElementType],
        file: StaticString, line: UInt
        ) -> XCUIElementQuery
    {
        guard let first = hierarchy.first else {
            XCTFail("At least one hierarchy element must be provided", file: file, line: line)
            return descendants(matching: type)
        }
        let root = descendants(matching: first)
        let container = hierarchy.dropFirst().reduce(root) { $0.descendants(matching: $1) }
        return container.descendants(matching: type)
    }
}
