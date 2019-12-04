import Foundation

let reservedWords: Set<String> = [
    "Protocol", "Type", "associatedtype", "class", "deinit", "enum", "extension",
    "fileprivate", "func", "import", "init", "inout", "internal", "let",
    "operator", "private", "protocol", "public", "static", "struct", "subscript",
    "typealias", "var", "_", "break", "case", "continue", "default", "defer", "do",
    "else", "fallthrough", "for", "guard", "if", "in", "repeat", "return", "switch",
    "where", "while", "as", "Any", "catch", "false", "is", "nil", "rethrows",
    "super", "self", "Self", "throw", "throws", "true", "try"
]

extension String {
    func sanitized() -> String {
        let value = components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: "_")
        return reservedWords.contains(value) ? "`\(value)`" : value
    }
}
