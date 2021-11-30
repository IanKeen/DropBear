import XCTest

public protocol TabBarRobot: Robot { }

public protocol TabBarItemContext: NavigationControllerContext {
    associatedtype TabBarConfiguration
    associatedtype TabBarContext: RobotContext
    associatedtype TabBarCurrent: Robot
    associatedtype TabBarPrevious: Robot

    typealias TabBar = RunningRobot<TabBarConfiguration, TabBarContext, TabBarCurrent, TabBarPrevious>

    var tabBar: TabBar { get }
}

public struct TabBarItem<NavigationElement, TabBarConfiguration, TabBarContext: RobotContext, TabBarCurrent: Robot, TabBarPrevious: Robot>: TabBarItemContext {
    public let tabBar: TabBar
}

extension RunningRobot where Current: TabBarRobot {
    public typealias TabItemRobot<NavigationElement, Next: Robot> = RunningRobot<
        Configuration,
        TabBarItem<NavigationElement, Configuration, Context, Current, Previous>,
        Next,
        RunningRobot<Configuration, Context, Current, Previous>
    >

    public struct TabItemAction {
        let element: (_ tabBar: XCUIElement) -> XCUIElement

        public static func tab(_ index: Int, file: StaticString = #file, line: UInt = #line) -> TabItemAction {
            return .init { tabBar in
                if index < 0 || index >= tabBar.buttons.count {
                    XCTFail("Invalid tab index. Value should be between 0 and \(tabBar.buttons.count - 1)", file: file, line: line)
                }

                return tabBar.buttons.element(boundBy: index)
            }
        }

        public static func tab(_ element: Element, file: StaticString = #file, line: UInt = #line) -> TabItemAction {
            return .init { tabBar in
                return tabBar.buttons[element.rawValue]
            }
        }
    }

    public func nextRobot<NavigationElement, Next: Robot>(_: Next.Type = Next.self, action: TabItemAction, file: StaticString = #file, line: UInt = #line) -> TabItemRobot<NavigationElement, Next> {
        DropBear.poll(until: { self.source.tabBars.firstMatch.buttons.count > 0 }, timeout: DropBear.defaultWaitTime)

        let tabBar = source.tabBars.firstMatch

        if tabBar.buttons.count == 0 {
            XCTFail("Unable to find any tab buttons", file: file, line: line)
        }

        let tabItem = action.element(tabBar)

        tabItem.tap()

        return .init(configuration: configuration, context: .init(tabBar: self), current: .init(source: source), previous: self)
    }
}

extension RunningRobot where Context: TabBarItemContext {
    public func backToTabBarController(file: StaticString = #file, line: UInt = #line) -> Context.TabBar {
        return context.tabBar
    }
}
