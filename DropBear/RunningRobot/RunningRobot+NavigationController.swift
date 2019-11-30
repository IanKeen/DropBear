import XCTest

public enum NavigationController: RobotContext { }

extension RunningRobot {
    public typealias NavigationRobot<Next: Robot> = RunningRobot<NavigationController, Next, RunningRobot<Context, Current, Previous>>

    public enum NavigationAction { case push }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: NavigationAction) -> NavigationRobot<T> {
        return .init(current: .init(app: app), previous: self)
    }
}

extension RunningRobot where Context == NavigationController {
    public func popNavigationController(file: StaticString = #file, line: UInt = #line) -> Previous {
        if app.navigationBars.buttons.count == 0 {
            XCTFail("Unable to find a navigation button", file: file, line: line)
        }

        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        return previous
    }
}
