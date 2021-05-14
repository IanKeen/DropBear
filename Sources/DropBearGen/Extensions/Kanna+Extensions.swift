import Kanna

extension XMLElement {
    func parent(tagNames: [String]) -> XMLElement? {
        var current: XMLElement = self
        var match: XMLElement? = nil

        while let element = current.parent {
            defer { current = element }

            guard
                let tagName = element.tagName,
                tagNames.contains(tagName)
                else { continue }

            match = element
            break
        }

        return match
    }
}
