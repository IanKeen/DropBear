//
//  RunningRobot+TabBarRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DropBearSupport
import XCTest

public protocol TabBarHierarchy {
    associatedtype Parent

    var parent: Parent { get }
}

public struct TabBarController<Parent>: TabBarHierarchy {
    public let parent: Parent
}

extension RunningRobot {
    public typealias TabBarRobot<Next: Robot> = RunningRobot<
        Configuration,
        TabBarController<ViewHierarchy>,
        Next
    >
}

extension RunningRobot.NextRobotAction {
    public static var tabs: RunningRobot.NextRobotAction<TabBarController<ViewHierarchy>, Next> {
        return .init(hierarchy: { .init(parent: $0.viewHierarchy) }, next: Next.init)
    }
}

extension RunningRobot {
    public func inTabController() -> RunningRobot<Configuration, TabBarController<ViewHierarchy>, Current> {
        return .init(app: app, configuration: configuration, viewHierarchy: .init(parent: viewHierarchy), current: current)
    }
}
