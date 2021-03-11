//
//  AlertRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

public class AlertRobot<Alert: AlertType, Previous: Robot>: RestrictedRobotBase {
    let previous: Previous
    let alert: XCUIElement
    let required: Bool

    public required init(previous: Previous, alert: XCUIElement, required: Bool, source: XCUIElement) {
        self.previous = previous
        self.alert = alert
        self.required = required
        super.init(source: source)
    }
    public required init(source: XCUIElement) {
        fatalError("This Robot can not be created this way")
    }
}
