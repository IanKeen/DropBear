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
    associatedtype TabController
    associatedtype Parent

    var tabController: TabController { get }
    var parent: Parent { get }
}

public struct TabItem<Parent, TabController>: TabItemHierarchy, TabBarHierarchy {
    public let tabController: TabController
    public let parent: Parent
}

extension RunningRobot where ViewHierarchy: TabBarHierarchy {
    public typealias TabItemRobot<Next: Robot> = RunningRobot<
        Configuration,
        TabItem<ViewHierarchy, RunningRobot>,
        Next
    >
}

extension RunningRobot.NextRobotAction where ViewHierarchy: TabBarHierarchy {
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

        public static func item(_ element: Current.Element, file: StaticString = #file, line: UInt = #line) -> TabItemLookup {
            return .init { tabBar in
                return tabBar.buttons[element.rawValue]
            }
        }
    }

    /// Used to put the _next_ `Robot` into a tab item
    public static func tab(
        _ lookup: TabItemLookup,
        file: StaticString = #file, line: UInt = #line
    ) -> RunningRobot.NextRobotAction<TabItem<ViewHierarchy, RunningRobot>, Next> {
        return .init(
            actions: { robot in
                let tabBar = robot.source.tabBars.firstMatch

                if tabBar.buttons.count == 0 {
                    XCTFail("Unable to find any tab buttons", file: file, line: line)
                }

                let tabItem = lookup.tabItem(robot.source)

                tabItem.tap()
            },
            hierarchy: { .init(tabController: $0, parent: $0.viewHierarchy) },
            next: Next.init
        )
    }
}

extension RunningRobot where ViewHierarchy: TabItemHierarchy {
    public func backToTabBarController() -> ViewHierarchy.TabController {
        return viewHierarchy.tabController
    }
}
