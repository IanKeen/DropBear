import Foundation

public var isUITesting: Bool {
    return ProcessInfo.processInfo.environment["UITesting"] != nil
}

public func UITestConfiguration<T: Codable>(_: T.Type = T.self) -> T? {
    guard let json = ProcessInfo.processInfo.environment["UITestConfiguration"] else {
        print(
            """
            No UI test configuration has been provided.
            Please preload one using `XCUIApplication.launchForTesting(with:)` or `XCUIApplication.useConfiguration(_:)`
            """
        )
        return nil
    }
    return try! JSONDecoder().decode(T.self, from: Data(json.utf8))
}
