import SwiftSyntax
import SwiftSyntaxParser

public final class SyntaxExtractor: Extractor {
    // MARK: - Lifecycle
    public init() { }

    // MARK: - Public Functions
    public func accessibilityIdentifierPairs(for file: Path) throws -> [AccessibilityIdentifierPair] {
        guard file.extension == "swift" else { return [] }

        let visitor = Visitor()
        let syntax = try SyntaxParser.parse(file.url)
        visitor.walk(syntax)
        return visitor.pairs
    }
}

private class Visitor: SyntaxVisitor {
    var pairs: [AccessibilityIdentifierPair] = []

    override func visitPost(_ node: MemberAccessExprSyntax) {
        guard
            node.name.text == "accessibilityIdentifier",
            let pair = extractUIKit(node) ?? extractSwiftUI(node)
            else { return }

        pairs.append(pair)
    }

    private func extractSwiftUI(_ node: MemberAccessExprSyntax) -> AccessibilityIdentifierPair? {
        guard
            let tuple = node.parent?._syntaxNode.firstSearchingDown(of: TupleExprElementListSyntax.self),
            let value = tuple._syntaxNode.firstSearchingDown(of: StringSegmentSyntax.self)?.content.text,
            let enclosingView = node._syntaxNode.firstSearchingUp(of: StructDeclSyntax.self)
            else { return nil }

        return .init(parent: enclosingView.identifier.text, identifier: value)
    }
    private func extractUIKit(_ node: MemberAccessExprSyntax) -> AccessibilityIdentifierPair? {
        guard
            let expression = node.parent?.as(ExprListSyntax.self),
            let value = expression._syntaxNode.firstSearchingDown(of: StringSegmentSyntax.self)?.content.text,
            let enclosingClass = node._syntaxNode.firstSearchingUp(of: ClassDeclSyntax.self)
            else { return nil }

        return .init(parent: enclosingClass.identifier.text, identifier: value)
    }
}

extension Syntax {
    func firstSearchingUp<T: SyntaxProtocol>(of: T.Type, where predicate: (T) -> Bool = { _ in true }) -> T? {
        if let result = self.as(T.self), predicate(result) { return result }
        return parent?.firstSearchingUp(of: T.self, where: predicate)
    }
    func firstSearchingDown<T: SyntaxProtocol>(of: T.Type, where predicate: (T) -> Bool = { _ in true }) -> T? {
        if let result = self.as(T.self), predicate(result) { return result }

        var queue: [Syntax] = [self]

        while let item = queue.first {
            if let result = item.as(T.self), predicate(result) {
                return result
            }
            queue.removeFirst()

            queue.append(contentsOf: item.children.map { $0 })
        }

        return nil
    }
}
