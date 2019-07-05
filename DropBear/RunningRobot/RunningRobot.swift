import XCTest

public class RunningRobot<Current: Robot, Previous: Robot>: RunningRobotType {
    public typealias Container = Current.Container

    public var app: XCUIApplication { return current.app }

    public let current: Current
    public let previous: Previous

    public required init(current: Current, previous: Previous) {
        self.current = current
        self.previous = previous
    }

    public required convenience init(app: XCUIApplication) {
        fatalError("This Robot should not be created this way")
    }
}

extension RunningRobot: AccessibleRobot where Current: AccessibleRobot {
    public typealias Element = Current.Element
}

public protocol RunningRobotType: Robot {
    associatedtype Current: Robot
    associatedtype Previous: Robot

    var current: Current { get }
    var previous: Previous { get }

    init(current: Current, previous: Previous)
}
