//
//  RunningRobot+TabItemNavigationRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-17.
//  Copyright © 2021 Mustard. All rights reserved.
//

import DropBearSupport
import XCTest

extension RunningRobot where ViewHierarchy: TabBarHierarchy {
    public typealias TabItemNavigationRobot<NavigationElement, Next: Robot> = RunningRobot<
        Configuration,
        NavigationController<
            NavigationElement,
            TabItem<RunningRobot, ViewHierarchy>
        >,
        Next
    >
}
