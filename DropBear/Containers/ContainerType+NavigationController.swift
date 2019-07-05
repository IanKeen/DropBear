import XCTest

extension Containers {
    public enum NavigationController: NavigationControllerType { }
}

extension RunningRobot where Container: NavigationControllerType {
    public func popNavigationController(required: Bool = true, file: StaticString = #file, line: UInt = #line) -> Previous {
        if !required && app.navigationBars.buttons.count == 0 {
            return previous
        }

        if app.navigationBars.buttons.count == 0 {
            XCTFail("Unable to find a navigation button", file: file, line: line)
        }

        app.navigationBars.buttons.element(boundBy: 0).tap()
        return previous
    }
}
