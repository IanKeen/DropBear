import XCTest

public protocol TabBarRobot: Robot { }

public enum TabBarItem: RobotContext { }

extension RunningRobot where Current: TabBarRobot {
    public typealias TabItemRobot<Next: Robot> = RunningRobot<TabBarItem, Next, RunningRobot<Context, Current, Previous>>

    public enum TabItemAction { case tab(Int) }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: TabItemAction, file: StaticString = #file, line: UInt = #line) -> TabItemRobot<T> {
        guard case .tab(let index) = action else { fatalError("Something has gone horribly wrong") }

        let tabBar = app.tabBars.firstMatch

        if tabBar.buttons.count == 0 {
            XCTFail("Unable to find any tab buttons", file: file, line: line)
        }

        if index < 0 || index >= app.tabBars.buttons.count {
            XCTFail("Invalid tab index. Value should be between 0 and \(app.tabBars.buttons.count - 1)", file: file, line: line)
        }

        app.tabBars.buttons.element(boundBy: index).tap()

        return .init(current: .init(app: app), previous: self)
    }
}

extension RunningRobot where Context == TabBarItem {
    public func backToTabBarController(file: StaticString = #file, line: UInt = #line) -> Previous {
        return previous
    }
}
