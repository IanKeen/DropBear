//
//  SettingsRobot.swift
//  DropBearAppUITests
//
//  Created by Ian Keen on 2021-03-12.
//  Copyright © 2021 Mustard. All rights reserved.
//

import DomainKit
import DropBear
import TestKit

class SettingsRobot: RobotBase, Robot {
    typealias Element = AccessibilityIdentifiers.SettingsViewController
}
extension RunningRobot where Current == SettingsRobot {
    func logOut() -> RootRobot<LoginRobot> {
        tap(.logOut)
            .alert(.logOutConfirmation)
            .tap(.yes)
            .nextRobot(action: .root)
    }
}
