import Foundation

public var isUITesting: Bool {
    return ProcessInfo.processInfo.environment["UITesting"] != nil
}

@dynamicMemberLookup
public struct TestConfiguration<T: Codable> {
    public let temporaryPath: URL
    public let config: T

    init(in temporaryPath: URL) {
        let configuration = temporaryPath.appendingPathComponent("configuration.json", isDirectory: false)
        self.config =  try! JSONDecoder().decode(T.self, from: Data(contentsOf: configuration))
        self.temporaryPath = temporaryPath
    }

    public subscript<U>(dynamicMember keyPath: KeyPath<T, U>) -> U {
        return config[keyPath: keyPath]
    }
}

public func UITestConfiguration<T: Codable>(_: T.Type = T.self) -> TestConfiguration<T>? {
    guard let folder = ProcessInfo.processInfo.environment["UITestingFolder"] else {
        print(
            """
            No UI test configuration has been provided.
            Please preload one using `XCUIApplication.launchForTesting(with:)`, `XCUIApplication.useConfiguration(_:)`
            or by launching a robot with `YourRobot.launch(using:)`
            """
        )
        return nil
    }

    return TestConfiguration(in: URL(fileURLWithPath: folder))
}
