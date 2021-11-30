import XCTest

public enum NoNavigationElement { }

public protocol NavigationControllerContext: RobotContext {
    associatedtype NavigationElement
}

public struct NavigationController<NavigationElement, Inner: RobotContext>: NavigationControllerContext {
    let inner: Inner
}

extension NavigationController: TabBarItemContext where Inner: TabBarItemContext {
    public var tabBar: Inner.TabBar { return inner.tabBar }
}

extension NavigationController: ModalContext where Inner: ModalContext {
    public var presenter: Inner.Presenter { return inner.presenter }
}

extension RunningRobot {
    public typealias NavigationRobot<NavigationElement, Next: Robot> = RunningRobot<
        Configuration,
        NavigationController<NavigationElement, Context>,
        Next,
        RunningRobot<Configuration, Context, Current, Previous>
    >

    public enum NavigationAction { case push }

    public func nextRobot<NavigationElement, Next: Robot>(_: Next.Type = Next.self, action: NavigationAction) -> NavigationRobot<NavigationElement, Next> {
        return .init(configuration: configuration, context: .init(inner: context), current: .init(source: source), previous: self)
    }
}

extension RunningRobot { //} where Context: TabBarItemContext {
    public typealias FullScreenNavigationRobot<NavigationElement, Next: Robot> = RunningRobot<Configuration, NavigationController<NavigationElement, NoContext>, Next, RunningRobot<Configuration, Context, Current, Previous>>

    public enum FullScreenNavigationAction { case push }

    public func nextRobot<NavigationElement, Next: Robot>(_: Next.Type = Next.self, action: FullScreenNavigationAction) -> FullScreenNavigationRobot<NavigationElement, Next> {
        return .init(configuration: configuration, context: .init(inner: .init()), current: .init(source: source), previous: self)
    }
}

extension RunningRobot where Context: NavigationControllerContext {
    public func popNavigationController(file: StaticString = #file, line: UInt = #line) -> Previous {
        if source.navigationBars.buttons.count == 0 {
            XCTFail("Unable to find a navigation button", file: file, line: line)
        }

        source.navigationBars.buttons.element(boundBy: 0).tap()

        return previous
    }
}
