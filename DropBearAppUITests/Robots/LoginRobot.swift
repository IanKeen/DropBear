//
//  LoginRobot.swift
//  DropBearAppUITests
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DomainKit
import DropBear
import TestKit

class LoginRobot: RobotBase, Robot {
    typealias Element = AccessibilityIdentifiers.LoginViewController
}
extension RunningRobot where Current == LoginRobot {
    func login() -> TabBarRobot<HomeRobot> {
        return tap(.login).nextRobot(action: .tabs)
    }
}
