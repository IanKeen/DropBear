//
//  HomeRobot.swift
//  DropBearAppUITests
//
//  Created by Ian Keen on 2021-03-12.
//  Copyright © 2021 Mustard. All rights reserved.
//

import DomainKit
import DropBear
import TestKit

class HomeRobot: RobotBase, Robot {
    typealias Element = AccessibilityIdentifiers.HomeViewController
}
extension RunningRobot where Current == HomeRobot, ViewHierarchy: TabBarHierarchy {
    func list() -> TabItemNavigationRobot<NoNavigationElement, ListRobot> {
        return nextRobot(ListRobot.self, action: .tab(.item(.list)), in: .navigation)
    }
    func settings() -> TabItemNavigationRobot<NoNavigationElement, SettingsRobot> {
        return nextRobot(action: .tab(.item(.settings)), in: .navigation)
    }
}
