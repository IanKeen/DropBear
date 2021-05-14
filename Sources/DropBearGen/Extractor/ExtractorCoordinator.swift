public class ExtractorCoordinator {
    enum Error: Swift.Error {
        case pathMustBeDirectory
    }

    // MARK: - Private Properties
    private let extractors: [Extractor]

    // MARK: - Lifecycle
    public init(extractors: [Extractor]) {
        self.extractors = extractors
    }

    // MARK: - Public Functions
    public func extract(from path: Path) throws -> [AccessibilityIdentifierPair] {
        guard path.isDirectory else { throw Error.pathMustBeDirectory }

        return try path.recursiveChildren().flatMap { path in
            return try extractors.flatMap { try $0.accessibilityIdentifierPairs(for: path) }
        }
    }
}
