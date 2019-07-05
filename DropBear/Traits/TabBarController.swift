import XCTest

public protocol TabBarController { }

extension RunningRobot where Current: TabBarController {
    public func nextRobot<T: Robot>(forTab index: Int, file: StaticString = #file, line: UInt = #line) -> NextRobot<T> {
        current.tabButton(at: index, file: file, line: line).tap()
        return nextRobot()
    }
}

extension Robot where Self: TabBarController {
    public func tabButton(at index: Int, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
        let firstTabBar = app.tabBars.firstMatch
        if !firstTabBar.exists { firstTabBar.waitForExistence(timeout: DropBear.defaultWaitTime) }

        guard index > -1 && index < app.tabBars.buttons.count else {
            XCTFail("Invalid tab index. Value should be between 0 and \(app.tabBars.buttons.count - 1)", file: file, line: line)
            return MissingXCUIElement(element: app.firstMatch)
        }
        return app.tabBars.buttons.element(boundBy: index)
    }
}
