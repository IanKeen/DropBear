import XCTest

public class AlertRobot<Alert: AlertType, Previous: Robot>: RestrictedRobotBase, Robot {
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
