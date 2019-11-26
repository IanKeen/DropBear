import XCTest

public class RunningRobot<Current: Robot, Previous: Robot>: Robot {
    public typealias Container = Current.Container
    public typealias Element = Current.Element

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

extension RunningRobot {
    public typealias NextRobot<Next: Robot> = RunningRobot<Next, RunningRobot<Current, Previous>>
    
    public func nextRobot<T: Robot>() -> NextRobot<T> {
        return NextRobot(current: .init(app: app), previous: .init(current: current, previous: previous))
    }
}
