import XCTest

public protocol RobotContext { }

public class RunningRobot<Context: RobotContext, Current: Robot, Previous: Robot>: Robot {
    public typealias Element = Current.Element

    public var app: XCUIApplication { return current.app }

    public let current: Current
    public let previous: Previous

    public required init(current: Current, previous: Previous) {
        self.current = current
        self.previous = previous
    }

    public required convenience init(app: XCUIApplication) {
        fatalError("This Robot can not be created this way")
    }
}
