import Foundation

public var isUITesting: Bool {
    return ProcessInfo.processInfo.environment["UITesting"] != nil
}

public func UITestConfiguration<T: Codable>(_: T.Type = T.self, file: StaticString = #file, line: UInt = #line) -> T {
    guard let json = ProcessInfo.processInfo.environment["UITestConfiguration"] else {
        fatalError(
            """
            No UI test configuration has been provided.
            Please preload one using `XCUIApplication.launchForTesting(with:)` or `XCUIApplication.useConfiguration(_:)`
            """,
            file: file,
            line: line
        )
    }
    return try! JSONDecoder().decode(T.self, from: Data(json.utf8))
}
