import XCTest

public struct ContextElement<Context: RobotContext> {
    let element: (XCUIElement) -> XCUIElement

    public init(element: @escaping (XCUIElement) -> XCUIElement) {
        self.element = element
    }
}
