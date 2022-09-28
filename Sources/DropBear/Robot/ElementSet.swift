public enum Unused: RawRepresentable {
    public var rawValue: String { fatalError("This should never be called `Unused` can't be constructed") }
    public init?(rawValue: String) { return nil }
}

/// A type that can be used to combine multiple sets of elements
public struct ElementSet<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable,
    F: RawRepresentable, G: RawRepresentable, H: RawRepresentable, I: RawRepresentable, J: RawRepresentable
    >: RawRepresentable, _ElementSet
    where
    A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String,
    F.RawValue == String, G.RawValue == String, H.RawValue == String, I.RawValue == String, J.RawValue == String
{
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public typealias ElementSet1<A: RawRepresentable> = ElementSet<A, Unused, Unused, Unused, Unused, Unused, Unused, Unused, Unused, Unused>
where A.RawValue == String

public typealias ElementSet2<A: RawRepresentable, B: RawRepresentable> = ElementSet<A, B, Unused, Unused, Unused, Unused, Unused, Unused, Unused, Unused>
where A.RawValue == String, B.RawValue == String

public typealias ElementSet3<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable> = ElementSet<A, B, C, Unused, Unused, Unused, Unused, Unused, Unused, Unused>
where A.RawValue == String, B.RawValue == String, C.RawValue == String

public typealias ElementSet4<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable> = ElementSet<A, B, C, D, Unused, Unused, Unused, Unused, Unused, Unused>
where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String

public typealias ElementSet5<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable> = ElementSet<A, B, C, D, E, Unused, Unused, Unused, Unused, Unused>
where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String

public typealias ElementSet6<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable, F: RawRepresentable> = ElementSet<A, B, C, D, E, F, Unused, Unused, Unused, Unused>
where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String, F.RawValue == String

public typealias ElementSet7<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable, F: RawRepresentable, G: RawRepresentable> = ElementSet<A, B, C, D, E, F, G, Unused, Unused, Unused>
where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String, F.RawValue == String, G.RawValue == String

public typealias ElementSet8<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable, F: RawRepresentable, G: RawRepresentable, H: RawRepresentable> = ElementSet<A, B, C, D, E, F, G, H, Unused, Unused>
where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String, F.RawValue == String, G.RawValue == String, H.RawValue == String

public typealias ElementSet9<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable, F: RawRepresentable, G: RawRepresentable, H: RawRepresentable, I: RawRepresentable> = ElementSet<A, B, C, D, E, F, G, H, I, Unused>
where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String, F.RawValue == String, G.RawValue == String, H.RawValue == String, I.RawValue == String

public typealias ElementSet10 = ElementSet

public protocol _ElementSet: RawRepresentable where RawValue == String {
    init(rawValue: String)
    
    associatedtype A: RawRepresentable where A.RawValue == String
    associatedtype B: RawRepresentable where B.RawValue == String
    associatedtype C: RawRepresentable where C.RawValue == String
    associatedtype D: RawRepresentable where D.RawValue == String
    associatedtype E: RawRepresentable where E.RawValue == String
    associatedtype F: RawRepresentable where F.RawValue == String
    associatedtype G: RawRepresentable where G.RawValue == String
    associatedtype H: RawRepresentable where H.RawValue == String
    associatedtype I: RawRepresentable where I.RawValue == String
    associatedtype J: RawRepresentable where J.RawValue == String
}

extension _ElementSet {
    public static func element(_ value: A) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: B) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: C) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: D) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: E) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: F) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: G) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: H) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: I) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: J) -> Self { .init(rawValue: value.rawValue) }
}
