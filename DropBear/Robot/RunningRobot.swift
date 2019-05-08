import XCTest

open class RunningRobot<Context: ContextType, Previous: Robot>: Robot {
    public let app: XCUIApplication
    public let previous: Previous

    required public init(app: XCUIApplication, previous: Previous) {
        self.app = app
        self.previous = previous
    }
}

public protocol RunningRobotType {
    associatedtype PreviousType

    init(app: XCUIApplication, previous: PreviousType)
}

extension RunningRobot: RunningRobotType {
    public typealias PreviousType = Previous
}

extension Robot {
    public func makeRobot<T: RunningRobotType>() -> T where T.PreviousType == Self {
        return T(app: app, previous: self)
    }
    public func makeRobot<T: RunningRobotType>() -> T where T.PreviousType == Root {
        return T(app: app, previous: Root(app: app))
    }
}

public class Root: Robot {
    public typealias Context = None
    
    public let app: XCUIApplication

    fileprivate init(app: XCUIApplication) {
        self.app = app
    }
}
