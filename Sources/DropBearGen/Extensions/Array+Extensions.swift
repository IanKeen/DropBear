import Foundation

extension Array {
    public subscript(safe index: Int) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }

    public func grouped<Key, Value>(key: (Element) -> Key, value: (Element) -> Value) -> [Key: [Value]] {
        return Dictionary(grouping: self, by: key).mapValues { groupedValues in
            return groupedValues.map(value)
        }
    }
}
