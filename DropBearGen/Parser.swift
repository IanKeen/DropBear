import Foundation

private enum Constants {
    static let identifierXPath = "//accessibility/@identifier"
    static let placeholderXPath = "placeholder[@placeholderIdentifier=\"IBFilesOwner\"]"
    static let customObjectXPath = "customObject[@userLabel=\"File's Owner\"]"

    static let customClassAttribute = "customClass"
    static let containerTags = [
        "viewController", "tableViewController", "collectionViewCell", "tableViewCell", "pagecontroller", "objects"
    ]

    static let storyboard = "storyboard"
    static let xib = "xib"
}

public struct AccessibilityItem {
    public let elementType: String
    public let identifier: String
    public let rawValue: String
}

public final class Parser {
    enum Error: Swift.Error {
        case pathMustBeDirectory
    }

    public typealias IdentifiersData = [String: [AccessibilityItem]]

    // MARK: - Public Properties
    public private(set) var accessibilityIdentifiers: IdentifiersData = [:]

    // MARK: - Lifecycle
    public init() { }

    // MARK: - Public Functions
    public func parse(path: Path) throws {
        guard path.isDirectory else { throw Error.pathMustBeDirectory }

        try performParse(path: path)
    }

    // MARK: - Private Functions
    private func performParse(path: Path) throws {
        switch path.extension {
        case Constants.storyboard?, Constants.xib?:
            try extractData(from: path)

        case nil:
            let dirChildren = path.iterateChildren(options: [.skipsHiddenFiles, .skipsPackageDescendants])

            for file in dirChildren {
                try performParse(path: file)
            }

        default:
            break
        }
    }
    private func extractData(from path: Path) throws {
        let document = try XML(xml: try path.read(), encoding: .utf8)

        typealias Pair = (String, AccessibilityItem)

        let pairs: [Pair] = document.xpath(Constants.identifierXPath).compactMap { element in
            guard
                let customClass = customClassFor(element: element, in: path),
                let identifier = element.text,
                let elementType = element.parent?.parent?.tagName
                else { return nil }

            let item = AccessibilityItem(elementType: elementType, identifier: identifier.sanitized(), rawValue: identifier)

            return (customClass, item)
        }

        let identifiers: IdentifiersData = pairs.grouped(
            key: { $0.0 },
            value: { $0.1 }
        )

        accessibilityIdentifiers += identifiers
    }
    private func customClassFor(element: XMLElement, in path: Path) -> String? {
        switch path.extension {
        case Constants.storyboard?, Constants.xib?:
            guard let parent = element.parent(tagNames: Constants.containerTags) else { return nil }

            if let className = parent[Constants.customClassAttribute] {
                return className
            } else if let placeholder = parent.xpath(Constants.placeholderXPath).first {
                return placeholder[Constants.customClassAttribute]
            } else if let placeholder = parent.xpath(Constants.customObjectXPath).first {
                return placeholder[Constants.customClassAttribute]
            } else {
                return nil
            }

        default:
            return nil
        }
    }
}
