import XCTest

public struct ContextElement<Context: RobotContext> {
    let element: (XCUIApplication) -> XCUIElement

    public init(element: @escaping (XCUIApplication) -> XCUIElement) {
        self.element = element
    }
}
