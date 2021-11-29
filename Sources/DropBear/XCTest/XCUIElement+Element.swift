import XCTest

extension XCUIElement {
    public func element(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, function: String = #function, line: UInt = #line
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
}
