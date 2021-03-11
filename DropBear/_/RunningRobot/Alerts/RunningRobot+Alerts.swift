//
//  RunningRobot+Alerts.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension RunningRobot {
    public typealias ActiveAlertRobot<T: AlertButtons> = AlertRobot<Alert<T>, RunningRobot<Configuration, ViewHierarchyContext, Current, Previous>>

    public func alert<T: AlertButtons>(_ alert: Alert<T>, required: Bool = true, file: StaticString = #file, line: UInt = #line) -> ActiveAlertRobot<T> {
        let dialog = alert.source(source).alerts.firstMatch
        let actualDialog: XCUIElement
        if required {
            actualDialog = dialog.assert(.exists, alert.assertion, file: file, line: line)
        } else {
            actualDialog = dialog.optional()
        }

        return .init(previous: self, alert: actualDialog, required: required, source: source)
    }
}

extension AlertRobot {
    public func tap(_ button: Alert.Buttons, file: StaticString = #file, line: UInt = #line) -> Previous {
        let element = button.buttonElement(from: alert)

        let actualElement: XCUIElement
        if required {
            actualElement = element.assert(.exists, file: file, line: line)
        } else {
            actualElement = element.optional()
        }
        actualElement.tap()

        return previous
    }
}
