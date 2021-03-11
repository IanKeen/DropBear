//
//  RunningRobot+Root.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

extension RunningRobot {
    public typealias RootRobot<Next: Robot> = RunningRobot<Configuration, NoViewHierarchy, Next, Root>
    
    public enum RootAction {
        case root
    }

    public func nextRobot<Next: Robot>(_: Next.Type = Next.self, action: RootAction) -> RootRobot<Next> {
        return RootRobot(app: app, configuration: configuration, viewHierarchy: .init(), current: .init(source: source), previous: .init(source: source))
    }
}
