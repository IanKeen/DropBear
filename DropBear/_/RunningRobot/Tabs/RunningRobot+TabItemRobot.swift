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
    associatedtype ViewHierarchyContext
    associatedtype Current: Robot
    associatedtype Previous: Robot

    typealias TabController = RunningRobot<Configuration, ViewHierarchyContext, Current, Previous>

    var tabController: TabController { get }
}

public struct TabItem<Configuration: TestConfigurationSource, ViewHierarchyContext, Current: Robot, Previous: Robot>: TabItemHierarchy, TabBarHierarchy {
    public let tabController: RunningRobot<Configuration, ViewHierarchyContext, Current, Previous>
}

extension RunningRobot where ViewHierarchyContext: TabBarHierarchy {
    public typealias TabItemRobot<Next: Robot> = RunningRobot<
        Configuration,
        TabItem<Configuration, ViewHierarchyContext, Current, Previous>,
        Next,
        RunningRobot
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

    public func nextRobot<Next: Robot>(_: Next.Type = Next.self, action: TabItemAction, file: StaticString = #file, line: UInt = #line) -> TabItemRobot<Next> {
        let tabBar = source.tabBars.firstMatch

        if tabBar.buttons.count == 0 {
            XCTFail("Unable to find any tab buttons", file: file, line: line)
        }

        let tabItem = action.element(tabBar)

        tabItem.tap()

        return .init(app: app, configuration: configuration, viewHierarchy: .init(tabController: self), current: .init(source: source), previous: self)
    }
}

extension RunningRobot where ViewHierarchyContext: TabItemHierarchy {
    public func backToTabBarController(file: StaticString = #file, line: UInt = #line) -> ViewHierarchyContext.TabController {
        return viewHierarchy.tabController
    }
}
