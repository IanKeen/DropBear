import XCTest

extension RunningRobot {
    public typealias ActiveAlertRobot<T: AlertButton> = AlertRobot<Alert<T>, RunningRobot<Context, Current, Previous>>

    public func alert<T: AlertButton>(_ alert: Alert<T>, required: Bool = true, file: StaticString = #file, line: UInt = #line) -> ActiveAlertRobot<T> {
        let dialog = alert.source(app).alerts.firstMatch
        let actualDialog: XCUIElement
        if required {
            actualDialog = dialog.assert(.exists, alert.assertion, file: file, line: line)
        } else {
            actualDialog = dialog.optional()
        }

        return .init(previous: self, alert: actualDialog, required: required, app: app)
    }
}

extension AlertRobot {
    public func tap(_ button: Alert.AlertButtonType, file: StaticString = #file, line: UInt = #line) -> Previous {
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
