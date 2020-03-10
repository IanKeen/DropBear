import XCTest

public protocol RobotContext { }

public struct NoContext: RobotContext { }

public struct NoConfiguration { }

public class RunningRobot<Configuration, Context: RobotContext, Current: Robot, Previous: Robot>: Robot {
    public typealias Element = Current.Element

    public var source: XCUIElement { return current.source }

    public let configuration: Configuration
    public let context: Context
    public let current: Current
    public let previous: Previous

    required init(configuration: Configuration, context: Context, current: Current, previous: Previous) {
        self.configuration = configuration
        self.context = context
        self.current = current
        self.previous = previous
    }

    public required convenience init(source: XCUIElement) {
        fatalError("This Robot can not be created this way")
    }
}

extension RunningRobot: Assertable where Current: Assertable { }
extension RunningRobot: Actionable where Current: Actionable { }
