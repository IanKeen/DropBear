import SwiftSyntax

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
            let expression = node.parent?.as(ExprListSyntax.self),
            let value = expression._syntaxNode.firstSearchingDown(of: StringSegmentSyntax.self)?.content.text,
            let enclosingClass = node._syntaxNode.firstSearchingUp(of: ClassDeclSyntax.self)
            else { return }

        pairs.append(.init(
            parent: enclosingClass.identifier.text,
            identifier: value
        ))
    }
}

extension Syntax {
    func firstSearchingUp<T: SyntaxProtocol>(of: T.Type, where predicate: (T) -> Bool = { _ in true }) -> T? {
        if let result = self.as(T.self), predicate(result) { return result }
        return parent?.firstSearchingUp(of: T.self, where: predicate)
    }
    func firstSearchingDown<T: SyntaxProtocol>(of: T.Type, where predicate: (T) -> Bool = { _ in true }) -> T? {
        if let result = self.as(T.self), predicate(result) { return result }
        return children.compactMap({ $0.firstSearchingDown(of: T.self, where: predicate) }).first
    }
}
