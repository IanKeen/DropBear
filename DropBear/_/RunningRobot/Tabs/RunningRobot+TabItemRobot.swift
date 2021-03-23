//
//  RunningRobot+TabItemRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-11.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DropBearSupport
import XCTest

public protocol TabItemHierarchy {
    associatedtype Configuration: TestConfigurationSource
    associatedtype ViewHierarchy
    associatedtype Current: Robot

    typealias TabController = RunningRobot<Configuration, ViewHierarchy, Current>

    var tabController: TabController { get }
}

public struct TabItem<Configuration: TestConfigurationSource, Parent, Current: Robot>: TabItemHierarchy, TabBarHierarchy {
    public let parent: Parent
    public let tabController: RunningRobot<Configuration, Parent, Current>
}

extension RunningRobot where ViewHierarchy: TabBarHierarchy {
    public typealias TabItemRobot<Next: Robot> = RunningRobot<
        Configuration,
        TabItem<Configuration, ViewHierarchy, Current>,
        Next
    >

    public struct TabItemLookup {
        let tabItem: (_ tabBar: XCUIElement) -> XCUIElement

        public static func item(_ index: Int, file: StaticString = #file, line: UInt = #line) -> TabItemLookup {
            return .init { tabBar in
                if index < 0 || index >= tabBar.buttons.count {
                    XCTFail("Invalid tab index. Value should be between 0 and \(tabBar.buttons.count - 1)", file: file, line: line)
                }

                return tabBar.buttons.element(boundBy: index)
            }
        }

        public static func item(_ element: Element, file: StaticString = #file, line: UInt = #line) -> TabItemLookup {
            return .init { tabBar in
                return tabBar.buttons[element.rawValue]
            }
        }
    }

    public struct TabItemAction<Hierarchy, Next: Robot> {
        let lookup: TabItemLookup
        let action: NextRobotAction<Hierarchy, Next>

        public static func tab(
            _ lookup: TabItemLookup,
            in modifier: ViewHierarchyModifier<TabItem<Configuration, ViewHierarchy, Current>, Hierarchy>
        ) -> TabItemAction {
            return .init(lookup: lookup, action: .init(hierarchy: { modifier.modify(.init(parent: $0.viewHierarchy, tabController: $0)) }, next: Next.init))
        }
    }

    public func nextRobot<Hierarchy, Next: Robot>(
        _: Next.Type = Next.self,
        action: TabItemAction<Hierarchy, Next>,
        file: StaticString = #file, line: UInt = #line
    ) -> RunningRobot<Configuration, Hierarchy, Next> {
        let tabBar = source.tabBars.firstMatch

        if tabBar.buttons.count == 0 {
            XCTFail("Unable to find any tab buttons", file: file, line: line)
        }

        let tabItem = action.lookup.tabItem(source)

        tabItem.tap()

        let hierarchy = action.action.hierarchy(self)
        let next = action.action.next(self)

        return .init(app: app, configuration: configuration, viewHierarchy: hierarchy, current: next)
    }
}

extension RunningRobot.TabItemAction {
    public static func tab(
        _ lookup: RunningRobot.TabItemLookup
    ) -> RunningRobot.TabItemAction<TabItem<Configuration, ViewHierarchy, Current>, Next> {
        return .init(lookup: lookup, action: .init(hierarchy: { .init(parent: $0.viewHierarchy, tabController: $0) }, next: Next.init))
    }
}

extension RunningRobot where ViewHierarchy: TabItemHierarchy {
    public func backToTabBarController() -> ViewHierarchy.TabController {
        return viewHierarchy.tabController
    }
}
