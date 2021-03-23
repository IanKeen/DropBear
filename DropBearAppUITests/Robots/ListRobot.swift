//
//  ListRobot.swift
//  DropBearAppUITests
//
//  Created by Ian Keen on 2021-03-12.
//  Copyright © 2021 Mustard. All rights reserved.
//

import DomainKit
import DropBear
import TestKit

class ListRobot: RobotBase, CellContainerRobot {
    typealias Element = AccessibilityIdentifiers.ListViewController
    typealias CellItem = ListItemRobot
}
extension RunningRobot where Current == ListRobot {
    //
}
