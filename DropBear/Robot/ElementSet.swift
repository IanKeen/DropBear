public enum Unused: RawRepresentable {
    public var rawValue: String { fatalError("This should never be called `Unused` can't be constructed") }
    public init?(rawValue: String) { return nil }
}

/// A type that can be used to combine multiple sets of elements
public struct ElementSet<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable
    >: RawRepresentable
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String
{
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static func element(_ value: A) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: B) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: C) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: D) -> Self { .init(rawValue: value.rawValue) }
}
