import XCTest

extension XCUIElement {
    public func required(file: StaticString = #file, line: UInt = #line) -> XCUIElement {
        if !exists { XCTFail("Required element '\(identifier)' was not found", file: file, line: line) }
        return self
    }

    public func optional(wait: TimeInterval = DropBear.defaultWaitTime) -> XCUIElement {
        return waitForExistence(timeout: wait)
            ? self
            : MissingXCUIElement(element: self)
    }
}

/// Internal `XCUIApplication` subclass that is returned when an optional element is requested but not found.
/// This prevents optional paths in test from failing when functions such as `tap()` are called on missing elements.
class MissingXCUIElement: XCUIApplication {
    override var exists: Bool { return false }
    override var isHittable: Bool { return false }
    override func waitForExistence(timeout: TimeInterval) -> Bool { return false }
    override var debugDescription: String { return String(describing: MissingXCUIElement.self) }

    init(element: XCUIElement) { super.init() }

    override func typeText(_ text: String) { }
    override func tap() { }
    override func doubleTap() { }
    override func twoFingerTap() { }
    override func tap(withNumberOfTaps numberOfTaps: Int, numberOfTouches: Int) { }
    override func press(forDuration duration: TimeInterval) { }
    override func press(forDuration duration: TimeInterval, thenDragTo otherElement: XCUIElement) { }
    override func swipeUp() { }
    override func swipeDown() { }
    override func swipeLeft() { }
    override func swipeRight() { }
    override func pinch(withScale scale: CGFloat, velocity: CGFloat) { }
    override func rotate(_ rotation: CGFloat, withVelocity velocity: CGFloat) { }
    override func adjust(toNormalizedSliderPosition normalizedSliderPosition: CGFloat) { }
    override func adjust(toPickerWheelValue pickerWheelValue: String) { }
    override var normalizedSliderPosition: CGFloat { return 0 }
}
