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

public final class InterfaceBuilderExtractor: Extractor {
    // MARK: - Lifecycle
    public init() { }

    // MARK: - Public Functions
    public func accessibilityIdentifierPairs(for file: Path) throws -> [AccessibilityIdentifierPair] {
        switch file.extension {
        case Constants.storyboard?, Constants.xib?:
            let document = try XML(xml: try file.read(), encoding: .utf8)

            let result: [AccessibilityIdentifierPair] = document.xpath(Constants.identifierXPath).compactMap { element in
                guard
                    let customClass = customClassFor(element: element, in: file),
                    let identifier = element.text
                    else { return nil }

                return AccessibilityIdentifierPair(parent: customClass, identifier: identifier)
            }
            return result

        default:
            return []
        }
    }

    // MARK: - Private Functions
    private func customClassFor(element: XMLElement, in file: Path) -> String? {
        switch file.extension {
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
