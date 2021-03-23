//
//  RunningRobot+NavigationRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-11.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

public protocol NavigationHierarchy {
    associatedtype NavigationElement
    associatedtype Parent

    var parent: Parent { get }
}

public struct NoNavigationElement { }

public struct NavigationController<NavigationElement, Parent>: NavigationHierarchy {
    public let parent: Parent
}

extension NavigationController: TabItemHierarchy where Parent: TabItemHierarchy  {
    public var tabController: Parent.TabController { parent.tabController }
}

extension RunningRobot {
    public typealias NavigationRobot<NavigationElement, Content: Robot> = RunningRobot<
        Configuration,
        NavigationController<NavigationElement, ViewHierarchy>,
        Content
    >
}

extension RunningRobot.NextRobotAction {
    /// Used to put the _next_ `Robot` into a navigation hierarchy
    public static var navigation: RunningRobot.NextRobotAction<NavigationController<NoNavigationElement, ViewHierarchy>, Next> {
        return .init(hierarchy: { .init(parent: $0.viewHierarchy) }, next: Next.init)
    }

    public static func navigation<T>(elements: T.Type) -> RunningRobot.NextRobotAction<NavigationController<T, ViewHierarchy>, Next> {
        return .init(hierarchy: { .init(parent: $0.viewHierarchy) }, next: Next.init)
    }
}

extension RunningRobot {
    /// Put the _current_ `Robot` into a navigation hierarchy
    public func inNavigationController() -> NavigationRobot<NoNavigationElement, Current> {
        return .init(app: app, configuration: configuration, viewHierarchy: .init(parent: viewHierarchy), current: current)
    }

    /// Put the _current_ `Robot` into a navigation hierarchy
    public func inNavigationController<T>(elements: T.Type) -> NavigationRobot<T, Current> {
        return .init(app: app, configuration: configuration, viewHierarchy: .init(parent: viewHierarchy), current: current)
    }
}

