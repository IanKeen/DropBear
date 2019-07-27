import XCTest

extension RunningRobot where Current: AlertRobotType {
    public func tap(_ button: Current.A.AlertButtonType, file: StaticString = #file, line: UInt = #line) -> Previous {
        let element = button.buttonElement(from: current.alert)

        let actualElement: XCUIElement
        if current.required {
            actualElement = element.assert(.exists, file: file, line: line)
        } else {
            actualElement = element.optional()
        }
        actualElement.tap()

        return previous
    }
}

extension RunningRobot {
    public func alert<T: AlertButton>(
        _ alert: Alert<T>,
        required: Bool = true,
        file: StaticString = #file, line: UInt = #line
        ) -> NextRobot<AlertRobot<Alert<T>>>
    {
        let dialog = alert.source(app).alerts.firstMatch
        let actualDialog: XCUIElement
        if required {
            actualDialog = dialog.assert(.exists, .contains(alert.text), file: file, line: line)
        } else {
            actualDialog = dialog.optional()
        }

        return .init(current: .init(alert: actualDialog, required: required, app: app), previous: self)
    }
}
