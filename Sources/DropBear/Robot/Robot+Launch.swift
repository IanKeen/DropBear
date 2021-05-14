import XCTest

public protocol Launchable { }

extension Robot where Self: Launchable {
    /// Launch the application for testing passing the provided configuration
    public static func launch<T: Codable>(using configuration: T, beforeLaunch: (XCUIApplication) -> Void = { _ in }) -> RunningRobot<T, NoContext, Self, Root> {
        let app = XCUIApplication()
        beforeLaunch(app)
        app.launchForTesting(with: configuration)
        return .init(configuration: configuration, context: .init(), current: .init(source: app), previous: .init(source: app))
    }

    /// Launch the application for testing
    public static func launch(beforeLaunch: (XCUIApplication) -> Void = { _ in }) -> RunningRobot<NoConfiguration, NoContext, Self, Root> {
        let app = XCUIApplication()
        beforeLaunch(app)
        app.launchForTesting()
        return .init(configuration: .init(), context: .init(), current: .init(source: app), previous: .init(source: app))
    }
}

public class Root: RobotBase, Robot { }
