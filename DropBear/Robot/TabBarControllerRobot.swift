import XCTest

public protocol TabBarControllerRobot: Robot { }

extension TabBarControllerRobot {
    public func makeRobot<T: RunningRobotType>(forTab index: Int, file: StaticString = #file, line: UInt = #line) -> T where T.PreviousType == Self {
        tabButton(at: index, file: file, line: line).tap()
        return T(app: app, previous: self)
    }

    private func tabButton(at index: Int, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
        guard index > -1 && index < app.tabBars.buttons.count else {
            XCTFail("Invalid tab index. Value should be between 0 and \(app.tabBars.buttons.count - 1)", file: file, line: line)
            return MissingXCUIElement(element: app.firstMatch)
        }
        return app.tabBars.buttons.element(boundBy: index)
    }
}
