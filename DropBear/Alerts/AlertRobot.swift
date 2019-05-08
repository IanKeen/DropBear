import XCTest

public class AlertRobot<A: AlertType, Previous: Robot>: RunningRobot<None, Previous> {
    private let alert: XCUIElement
    private let required: Bool

    required public init(alert: XCUIElement, required: Bool, app: XCUIApplication, previous: Previous) {
        self.alert = alert
        self.required = required
        super.init(app: app, previous: previous)
    }
    required public init(app: XCUIApplication, previous: Previous) {
        fatalError("Please use init(alert:app:previous:)")
    }

    public func tap(_ button: A.AlertButtonType, file: StaticString = #file, line: UInt = #line) -> Previous {
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

extension Robot {
    public func alert<T: AlertButton>(
        _ alert: Alert<T>,
        required: Bool = true,
        file: StaticString = #file, line: UInt = #line
        ) -> AlertRobot<Alert<T>, Self>
    {
        let dialog = Springboard.application.alerts.firstMatch
        let actualDialog: XCUIElement
        if required {
            actualDialog = dialog.assert(.exists, .contains(alert.text), file: file, line: line)
        } else {
            actualDialog = dialog.optional()
        }
        return AlertRobot(alert: actualDialog, required: required, app: app, previous: self)
    }
}
