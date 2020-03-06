import XCTest

public protocol NavigationControllerContext: RobotContext { }

public struct NavigationController<Inner: RobotContext>: NavigationControllerContext {
    let inner: Inner
}

extension NavigationController: TabBarItemContext where Inner: TabBarItemContext {
    public var tabBar: Inner.TabBar { return inner.tabBar }
}

extension NavigationController: ModalContext where Inner: ModalContext {
    public var presenter: Inner.Presenter { return inner.presenter }
}

extension RunningRobot {
    public typealias NavigationRobot<Next: Robot> = RunningRobot<Configuration, NavigationController<Context>, Next, RunningRobot<Configuration, Context, Current, Previous>>

    public enum NavigationAction { case push }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: NavigationAction) -> NavigationRobot<T> {
        return .init(configuration: configuration, context: .init(inner: context), current: .init(app: app), previous: self)
    }
}

extension RunningRobot { //} where Context: TabBarItemContext {
    public typealias FullScreenNavigationRobot<Next: Robot> = RunningRobot<Configuration, NavigationController<None>, Next, RunningRobot<Configuration, Context, Current, Previous>>

    public enum FullScreenNavigationAction { case pushFullScreen }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: FullScreenNavigationAction) -> FullScreenNavigationRobot<T> {
        return .init(configuration: configuration, context: .init(inner: .init()), current: .init(app: app), previous: self)
    }
}

extension RunningRobot where Context: NavigationControllerContext {
    public func popNavigationController(file: StaticString = #file, line: UInt = #line) -> Previous {
        if app.navigationBars.buttons.count == 0 {
            XCTFail("Unable to find a navigation button", file: file, line: line)
        }

        app.navigationBars.buttons.element(boundBy: 0).tap()

        return previous
    }
}
