import XCTest

extension AccessibleRobot {
    public func element(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> XCUIElement
    {
        return self.element(identifier: element.rawValue, in: hierarchy, file: file, line: line)
    }

    public func tap(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        numberOfTaps: Int = 1, numberOfTouches: Int = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return tap(identifier: element.rawValue, in: hierarchy, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }

    public func tap(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int,
        numberOfTaps: Int = 1, numberOfTouches: Int = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return tap(identifier: element.rawValue, in: hierarchy, index: index, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }

    public func press(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        duration: TimeInterval = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return press(identifier: element.rawValue, in: hierarchy, duration: duration, file: file, line: line)
    }

    public func press(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        duration: TimeInterval = 1,
        dragTo other: Element,
        in otherHierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return press(identifier: element.rawValue, in: hierarchy, duration: duration, dragTo: other.rawValue, in: otherHierarchy, file: file, line: line)
    }

    public func clearText(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return clearText(identifier: element.rawValue, in: hierarchy, file: file, line: line)
    }

    public func adjust(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        to position:  CGFloat,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return adjust(identifier: element.rawValue, in: hierarchy, to: position, file: file, line: line)
    }
}
