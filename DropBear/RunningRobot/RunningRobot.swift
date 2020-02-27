import XCTest

public protocol RobotContext { }

public struct NoConfiguration {
    init() { }
}

public class RunningRobot<Context: RobotContext, Configuration, Current: Robot, Previous: Robot>: Robot {
    public typealias Element = Current.Element

    public var app: XCUIApplication { return current.app }

    public let configuration: Configuration
    public let current: Current
    public let previous: Previous

    public required init(configuration: Configuration, current: Current, previous: Previous) {
        self.configuration = configuration
        self.current = current
        self.previous = previous
    }

    public required convenience init(app: XCUIApplication) {
        fatalError("This Robot can not be created this way")
    }
}
