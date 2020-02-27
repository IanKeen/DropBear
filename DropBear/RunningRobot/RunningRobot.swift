import XCTest

public protocol RobotContext { }

public struct NoConfiguration { }

public protocol RobotTree { }

public enum Base: RobotTree { }

public class RunningRobot<Configuration, Tree: RobotTree, Context: RobotContext, Current: Robot, Previous: Robot>: Robot {
    public typealias Element = Current.Element

    public var app: XCUIApplication { return current.app }

    public let configuration: Configuration
    public let current: Current
    public let previous: Previous

    required init(configuration: Configuration, current: Current, previous: Previous) {
        self.configuration = configuration
        self.current = current
        self.previous = previous
    }

    public required convenience init(app: XCUIApplication) {
        fatalError("This Robot can not be created this way")
    }
}
