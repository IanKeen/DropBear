import XCTest

public class AlertRobot<A: AlertType>: RobotBase, AlertRobotType {
    public typealias Container = Containers.None

    public let alert: XCUIElement
    public let required: Bool

    required public init(alert: XCUIElement, required: Bool, app: XCUIApplication) {
        self.alert = alert
        self.required = required
        super.init(app: app)
    }
    public required init(app: XCUIApplication) {
        fatalError("Please use init(alert:required:app:)")
    }
}

public protocol AlertRobotType: Robot {
    associatedtype A: AlertType

    var alert: XCUIElement { get }
    var required: Bool { get }
}
