import XCTest

extension XCUIApplication {
    public func launchForTesting() {
        launchEnvironment["UITesting"] = "true"
        launch()
    }
    public func launchForTesting<T: Codable>(with configuration: T) {
        useConfiguration(configuration)
        launchForTesting()
    }
    public func useConfiguration<T: Codable>(_ configuration: T) {
        launchEnvironment["UITestConfiguration"] = String(data: try! JSONEncoder().encode(configuration), encoding: .utf8)!
    }
}
