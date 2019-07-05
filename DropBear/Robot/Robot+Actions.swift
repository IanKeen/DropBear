import XCTest

extension Robot {
    public func element(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> XCUIElement
    {
        return app.element(identifier: identifier, in: hierarchy, file: file, line: line)
    }
    
    public func tap(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        numberOfTaps: Int = 1, numberOfTouches: Int = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let element = self.element(identifier: identifier, in: hierarchy, file: file, line: line)
        element.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches)
        return self
    }

    public func tap(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int,
        numberOfTaps: Int = 1, numberOfTouches: Int = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let element = self.element(identifier: identifier, in: hierarchy, file: file, line: line).buttons.element(boundBy: index)
        element.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches)
        return self
    }

    public func press(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        duration: TimeInterval = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let element = self.element(identifier: identifier, in: hierarchy, file: file, line: line)
        element.press(forDuration: duration)
        return self
    }

    public func press(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        duration: TimeInterval = 1,
        dragTo other: String,
        in otherHierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let source = element(identifier: identifier, in: hierarchy, file: file, line: line)
        let destination = element(identifier: other, in: otherHierarchy, file: file, line: line)
        source.press(forDuration: duration, thenDragTo: destination)
        return self
    }

    public func type(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        text: String,
        tapFirst: Bool = true,
        clearFirst: Bool = true,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let element = self.element(identifier: identifier, in: hierarchy, file: file, line: line)
        if tapFirst { element.tap() }
        if clearFirst { element.clearText(file: file, line: line) }
        element.typeText(text)
        return self
    }

    public func clearText(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element(identifier: identifier, in: hierarchy, file: file, line: line)
            .clearText(file: file, line: line)
        return self
    }

    public func adjust(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        to position:  CGFloat,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element(identifier: identifier, in: hierarchy, file: file, line: line).adjust(toNormalizedSliderPosition: position)
        return self
    }
}
