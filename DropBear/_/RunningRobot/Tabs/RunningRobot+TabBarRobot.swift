//
//  RunningRobot+TabBarRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DropBearSupport
import XCTest

public protocol TabBarHierarchy { }

public struct TabBarController<Parent>: TabBarHierarchy { }

extension ViewHierarchy: TabBarHierarchy where T: TabBarHierarchy { }

extension RunningRobot {
    public typealias TabBarRobot<Next: Robot> = RunningRobot<
        Configuration,
        TabBarController<ViewHierarchyContext>,
        Next,
        RunningRobot
    >
}

extension RunningRobot.NextRobotAction {
    public static var tabBar: RunningRobot.NextRobotAction<TabBarController<ViewHierarchyContext>, Next, RunningRobot> {
        return .init(hierarchy: .init(), next: Next.init)
    }
}

extension RunningRobot {
    public func inTabController() -> RunningRobot<Configuration, TabBarController<ViewHierarchyContext>, Current, Previous> {
        return .init(app: app, configuration: configuration, viewHierarchy: .init(), current: current, previous: previous)
    }
}
