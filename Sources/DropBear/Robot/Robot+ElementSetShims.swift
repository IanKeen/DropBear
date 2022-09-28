import XCTest

// MARK: - Assert
extension Robot where Self: Assertable, Element: _ElementSet {
    @discardableResult
    public func assert(_ element: Element.A, in hierarchy: [XCUIElement.ElementType] = [.any], _ assertion: ElementAssertion, file: StaticString = #file, line: UInt = #line) -> Self {
        return assert(.element(element), in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(_ element: Element.B, in hierarchy: [XCUIElement.ElementType] = [.any], _ assertion: ElementAssertion, file: StaticString = #file, line: UInt = #line) -> Self {
        return assert(.element(element), in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(_ element: Element.C, in hierarchy: [XCUIElement.ElementType] = [.any], _ assertion: ElementAssertion, file: StaticString = #file, line: UInt = #line) -> Self {
        return assert(.element(element), in: hierarchy, [assertion], file: file, line: line)
    }

    @discardableResult
    public func assert(_ element: Element.D, in hierarchy: [XCUIElement.ElementType] = [.any], _ assertion: ElementAssertion, file: StaticString = #file, line: UInt = #line) -> Self {
        return assert(.element(element), in: hierarchy, [assertion], file: file, line: line)
    }
}

// MARK: - Misc
extension Robot where Self: Actionable, Element: _ElementSet {
    public func adjust(_ element: Element.A, in hierarchy: [XCUIElement.ElementType] = [.any], to position:  CGFloat, file: StaticString = #file, line: UInt = #line) -> Self {
        return adjust(.element(element), in: hierarchy, to: position, file: file, line: line)
    }
    public func adjust(_ element: Element.B, in hierarchy: [XCUIElement.ElementType] = [.any], to position:  CGFloat, file: StaticString = #file, line: UInt = #line) -> Self {
        return adjust(.element(element), in: hierarchy, to: position, file: file, line: line)
    }
    public func adjust(_ element: Element.C, in hierarchy: [XCUIElement.ElementType] = [.any], to position:  CGFloat, file: StaticString = #file, line: UInt = #line) -> Self {
        return adjust(.element(element), in: hierarchy, to: position, file: file, line: line)
    }
    public func adjust(_ element: Element.D, in hierarchy: [XCUIElement.ElementType] = [.any], to position:  CGFloat, file: StaticString = #file, line: UInt = #line) -> Self {
        return adjust(.element(element), in: hierarchy, to: position, file: file, line: line)
    }
}

// MARK: - Tap
extension Robot where Self: Actionable, Element: _ElementSet {
    public func tap(_ element: Element.A, in hierarchy: [XCUIElement.ElementType] = [.any], numberOfTaps: Int = 1, numberOfTouches: Int = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return tap(.element(element), in: hierarchy, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }
    public func tap(_ element: Element.B, in hierarchy: [XCUIElement.ElementType] = [.any], numberOfTaps: Int = 1, numberOfTouches: Int = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return tap(.element(element), in: hierarchy, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }
    public func tap(_ element: Element.C, in hierarchy: [XCUIElement.ElementType] = [.any], numberOfTaps: Int = 1, numberOfTouches: Int = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return tap(.element(element), in: hierarchy, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }
    public func tap(_ element: Element.D, in hierarchy: [XCUIElement.ElementType] = [.any], numberOfTaps: Int = 1, numberOfTouches: Int = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return tap(.element(element), in: hierarchy, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }

    public func tap(_ element: Element.A, in hierarchy: [XCUIElement.ElementType] = [.any], index: Int, numberOfTaps: Int = 1, numberOfTouches: Int = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return tap(.element(element), in: hierarchy, index: index, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }
    public func tap(_ element: Element.B, in hierarchy: [XCUIElement.ElementType] = [.any], index: Int, numberOfTaps: Int = 1, numberOfTouches: Int = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return tap(.element(element), in: hierarchy, index: index, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }
    public func tap(_ element: Element.C, in hierarchy: [XCUIElement.ElementType] = [.any], index: Int, numberOfTaps: Int = 1, numberOfTouches: Int = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return tap(.element(element), in: hierarchy, index: index, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }
    public func tap(_ element: Element.D, in hierarchy: [XCUIElement.ElementType] = [.any], index: Int, numberOfTaps: Int = 1, numberOfTouches: Int = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return tap(.element(element), in: hierarchy, index: index, numberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches, file: file, line: line)
    }

    public func press(_ element: Element.A, in hierarchy: [XCUIElement.ElementType] = [.any], duration: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return press(.element(element), in: hierarchy, duration: duration, file: file, line: line)
    }
    public func press(_ element: Element.B, in hierarchy: [XCUIElement.ElementType] = [.any], duration: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return press(.element(element), in: hierarchy, duration: duration, file: file, line: line)
    }
    public func press(_ element: Element.C, in hierarchy: [XCUIElement.ElementType] = [.any], duration: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return press(.element(element), in: hierarchy, duration: duration, file: file, line: line)
    }
    public func press(_ element: Element.D, in hierarchy: [XCUIElement.ElementType] = [.any], duration: TimeInterval = 1, file: StaticString = #file, line: UInt = #line) -> Self {
        return press(.element(element), in: hierarchy, duration: duration, file: file, line: line)
    }

    public func press(_ element: Element.A, in hierarchy: [XCUIElement.ElementType] = [.any], duration: TimeInterval = 1, dragTo other: Element, in otherHierarchy: [XCUIElement.ElementType] = [.any], file: StaticString = #file, line: UInt = #line) -> Self {
        return press(.element(element), in: hierarchy, duration: duration, dragTo: other, in: otherHierarchy, file: file, line: line)
    }
    public func press(_ element: Element.B, in hierarchy: [XCUIElement.ElementType] = [.any], duration: TimeInterval = 1, dragTo other: Element, in otherHierarchy: [XCUIElement.ElementType] = [.any], file: StaticString = #file, line: UInt = #line) -> Self {
        return press(.element(element), in: hierarchy, duration: duration, dragTo: other, in: otherHierarchy, file: file, line: line)
    }
    public func press(_ element: Element.C, in hierarchy: [XCUIElement.ElementType] = [.any], duration: TimeInterval = 1, dragTo other: Element, in otherHierarchy: [XCUIElement.ElementType] = [.any], file: StaticString = #file, line: UInt = #line) -> Self {
        return press(.element(element), in: hierarchy, duration: duration, dragTo: other, in: otherHierarchy, file: file, line: line)
    }
    public func press(_ element: Element.D, in hierarchy: [XCUIElement.ElementType] = [.any], duration: TimeInterval = 1, dragTo other: Element, in otherHierarchy: [XCUIElement.ElementType] = [.any], file: StaticString = #file, line: UInt = #line) -> Self {
        return press(.element(element), in: hierarchy, duration: duration, dragTo: other, in: otherHierarchy, file: file, line: line)
    }
}


// MARK: - Text
extension Robot where Self: Actionable, Element: _ElementSet {
    public func type(_ element: Element.A, in hierarchy: [XCUIElement.ElementType] = [.any], text: String, tapFirst: Bool = true, clearFirst: Bool = true, file: StaticString = #file, line: UInt = #line) -> Self {
        return type(.element(element), in: hierarchy, text: text, tapFirst: tapFirst, clearFirst: clearFirst, file: file, line: line)
    }
    public func type(_ element: Element.B, in hierarchy: [XCUIElement.ElementType] = [.any], text: String, tapFirst: Bool = true, clearFirst: Bool = true, file: StaticString = #file, line: UInt = #line) -> Self {
        return type(.element(element), in: hierarchy, text: text, tapFirst: tapFirst, clearFirst: clearFirst, file: file, line: line)
    }
    public func type(_ element: Element.C, in hierarchy: [XCUIElement.ElementType] = [.any], text: String, tapFirst: Bool = true, clearFirst: Bool = true, file: StaticString = #file, line: UInt = #line) -> Self {
        return type(.element(element), in: hierarchy, text: text, tapFirst: tapFirst, clearFirst: clearFirst, file: file, line: line)
    }
    public func type(_ element: Element.D, in hierarchy: [XCUIElement.ElementType] = [.any], text: String, tapFirst: Bool = true, clearFirst: Bool = true, file: StaticString = #file, line: UInt = #line) -> Self {
        return type(.element(element), in: hierarchy, text: text, tapFirst: tapFirst, clearFirst: clearFirst, file: file, line: line)
    }

    public func clearText(_ element: Element.A, in hierarchy: [XCUIElement.ElementType] = [.any], file: StaticString = #file, line: UInt = #line) -> Self {
        return clearText(.element(element), in: hierarchy, file: file, line: line)
    }
    public func clearText(_ element: Element.B, in hierarchy: [XCUIElement.ElementType] = [.any], file: StaticString = #file, line: UInt = #line) -> Self {
        return clearText(.element(element), in: hierarchy, file: file, line: line)
    }
    public func clearText(_ element: Element.C, in hierarchy: [XCUIElement.ElementType] = [.any], file: StaticString = #file, line: UInt = #line) -> Self {
        return clearText(.element(element), in: hierarchy, file: file, line: line)
    }
    public func clearText(_ element: Element.D, in hierarchy: [XCUIElement.ElementType] = [.any], file: StaticString = #file, line: UInt = #line) -> Self {
        return clearText(.element(element), in: hierarchy, file: file, line: line)
    }
}
