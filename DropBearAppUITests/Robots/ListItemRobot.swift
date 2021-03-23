//
//  ListItemRobot.swift
//  DropBearAppUITests
//
//  Created by Ian Keen on 2021-03-19.
//  Copyright © 2021 Mustard. All rights reserved.
//

import DomainKit
import DropBear
import TestKit

class ListItemRobot: RobotBase, Robot {
    typealias Element = AccessibilityIdentifiers.ListItemCell
}
extension RunningRobot where Current == ListItemRobot {
    //
}
