//
//  RunningRobot+Root.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

extension RunningRobot {
    public typealias RootRobot<Next: Robot> = RunningRobot<Configuration, Window, Next>
}

extension RunningRobot.NextRobotAction {
    public static var root: RunningRobot.NextRobotAction<Window, Next> {
        return .init(hierarchy: .init(), next: Next.init)
    }
}
