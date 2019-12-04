public struct AccessibilityIdentifierPair {
    public let parent: String
    public let identifier: String
}

public protocol Extractor {
    func accessibilityIdentifierPairs(for file: Path) throws -> [AccessibilityIdentifierPair]
}
