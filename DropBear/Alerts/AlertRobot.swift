import XCTest

public class AlertRobot<Alert: AlertType, Previous: Robot>: RobotBase, Robot {
    let previous: Previous
    let alert: XCUIElement
    let required: Bool

    required public init(previous: Previous, alert: XCUIElement, required: Bool, app: XCUIApplication) {
        self.previous = previous
        self.alert = alert
        self.required = required
        super.init(app: app)
    }
    public required init(app: XCUIApplication) {
        fatalError("This Robot can not be created this way")
    }
}
