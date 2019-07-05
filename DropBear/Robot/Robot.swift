import XCTest

/// A `Robot` represents the actions that can be performed on a given screen
public protocol Robot {
    associatedtype Container: ContainerType

    var app: XCUIApplication { get }

    init(app: XCUIApplication)
}

extension Robot {
    /// Waits for the provided amount of time before continuing with the test
    public func wait(_ duration: TimeInterval) -> Self {
        Thread.sleep(forTimeInterval: duration)
        return self
    }
}


/// A pre-made base class you can use to avoid the `Robot` boilerplate code
/// It does not conform to `Robot` so consumers are still required to conform and
/// provide a value for `Container` 
open class RobotBase {
    public let app: XCUIApplication

    public required init(app: XCUIApplication) {
        self.app = app
    }
}
