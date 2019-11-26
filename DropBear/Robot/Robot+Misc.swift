import XCTest

extension Robot {
    public func adjust(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        to position:  CGFloat,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element
            .element(in: app, hierarchy: hierarchy, file: file, line: line)
            .adjust(toNormalizedSliderPosition: position)

        return self
    }
}
