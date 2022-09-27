//
//  ElementSet.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-19.
//

public enum NoElement: RawRepresentable {
    public var rawValue: String { fatalError("This should never be called `NoElement` can't be constructed") }
    public init?(rawValue: String) { nil }
}

/// A type that can be used to combine multiple sets of elements
public struct ElementSet<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable,
    E: RawRepresentable, F: RawRepresentable, G: RawRepresentable, H: RawRepresentable
    >: RawRepresentable
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String,
          E.RawValue == String, F.RawValue == String, G.RawValue == String, H.RawValue == String
{
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static func element(_ value: A) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: B) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: C) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: D) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: E) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: F) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: G) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: H) -> Self { .init(rawValue: value.rawValue) }
}

public typealias ElementSet1<A: RawRepresentable> = ElementSet<
    A, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement
> where A.RawValue == String

public typealias ElementSet2<A: RawRepresentable, B: RawRepresentable> = ElementSet<
    A, B, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement
> where A.RawValue == String, B.RawValue == String

public typealias ElementSet3<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable> = ElementSet<
    A, B, C, NoElement, NoElement, NoElement, NoElement, NoElement
> where A.RawValue == String, B.RawValue == String, C.RawValue == String

public typealias ElementSet4<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable> = ElementSet<
    A, B, C, D, NoElement, NoElement, NoElement, NoElement
> where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String

public typealias ElementSet5<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable> = ElementSet<
    A, B, C, D, E, NoElement, NoElement, NoElement
> where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String

public typealias ElementSet6<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable, F: RawRepresentable> = ElementSet<
    A, B, C, D, E, F, NoElement, NoElement
> where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String, F.RawValue == String

public typealias ElementSet7<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable, F: RawRepresentable, G: RawRepresentable> = ElementSet<
    A, B, C, D, E, F, G, NoElement
> where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String, F.RawValue == String, G.RawValue == String

public typealias ElementSet8 = ElementSet
