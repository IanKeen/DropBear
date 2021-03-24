//
//  RunningRobot+NavigationRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-11.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

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

    /// Used to put the _next_ `Robot` into a navigation hierarchy using the provided navigation elements
    public static func navigation<T>(elements: T.Type) -> RunningRobot.NextRobotAction<NavigationController<T, ViewHierarchy>, Next> {
        return .init(hierarchy: { .init(parent: $0.viewHierarchy) }, next: Next.init)
    }
}



