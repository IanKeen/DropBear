import XCTest

/// A specialized `Robot` representing a screen shown when the app first launches
open class LaunchingRobot<Container: ContainerType>: Robot {
    public let app: XCUIApplication

    public init<T: Codable>(configuration: T) {
        app = XCUIApplication()
        app.launchForTesting(with: configuration)
    }
    public init() {
        app = XCUIApplication()
        app.launchForTesting()
    }
}
