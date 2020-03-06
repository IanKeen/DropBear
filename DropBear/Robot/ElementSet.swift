public enum Unused: RawRepresentable {
    public var rawValue: String { fatalError("This should never be called `Unused` can't be constructed") }
    public init?(rawValue: String) { return nil }
}

/// A type that can be used to combine multiple sets of elements
public enum ElementSet<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable
    >: RawRepresentable
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String
{
    public typealias RawValue = String

    case a(A), b(B), c(C), d(D)

    public init?(rawValue: String) {
        let value = A(rawValue: rawValue).flatMap(ElementSet.a)
            ?? B(rawValue: rawValue).flatMap(ElementSet.b)
            ?? C(rawValue: rawValue).flatMap(ElementSet.c)
            ?? D(rawValue: rawValue).flatMap(ElementSet.d)

        guard let result = value else { return nil }

        self = result
    }

    public var rawValue: String {
        switch self {
        case .a(let value): return value.rawValue
        case .b(let value): return value.rawValue
        case .c(let value): return value.rawValue
        case .d(let value): return value.rawValue
        }
    }
}
