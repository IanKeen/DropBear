import XCTest

extension Robot {
    /// Launch the application for testing passing the provided configuration
    public static func launch<T: Codable>(using configuration: T) -> RunningRobot<Self, Root> {
        let app = XCUIApplication()
        app.launchForTesting(with: configuration)
        return .init(current: .init(app: app), previous: .init(app: app))
    }

    /// Launch the application for testing
    public static func launch() -> RunningRobot<Self, Root> {
        let app = XCUIApplication()
        app.launchForTesting()
        return .init(current: .init(app: app), previous: .init(app: app))
    }
}

public class Root: RobotBase, Robot {
    public typealias Container = Containers.None
}
