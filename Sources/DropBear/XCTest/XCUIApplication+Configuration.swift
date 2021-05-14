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
        let temporaryDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent(UUID().uuidString)
        try! FileManager.default.createDirectory(at: temporaryDirectoryURL, withIntermediateDirectories: true, attributes: nil)

        let configurationURL = temporaryDirectoryURL.appendingPathComponent("configuration.json", isDirectory: false)
        try! JSONEncoder().encode(configuration).write(to: configurationURL, options: .atomic)

        launchEnvironment["UITestingFolder"] = temporaryDirectoryURL.absoluteString
    }
}
