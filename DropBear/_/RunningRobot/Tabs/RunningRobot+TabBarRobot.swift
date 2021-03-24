//
//  RunningRobot+TabBarRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DropBearSupport
import XCTest

extension RunningRobot {
    public typealias TabBarRobot<Next: Robot> = RunningRobot<
        Configuration,
        TabBarController,
        Next
    >
}

extension RunningRobot.NextRobotAction {
    public static var tabs: RunningRobot.NextRobotAction<TabBarController, Next> {
        return .init(hierarchy: { _ in .init() }, next: Next.init)
    }
}

extension RunningRobot {
    public func inTabController() -> RunningRobot<Configuration, TabBarController, Current> {
        return .init(app: app, configuration: configuration, viewHierarchy: .init(), current: current)
    }
}
