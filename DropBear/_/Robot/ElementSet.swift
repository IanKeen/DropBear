//
//  ElementSet.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

/// A type that can be used to combine multiple `Robot.Element`s
///
/// - Tag: ElementSet
public struct ElementSet<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable,
    F: RawRepresentable, G: RawRepresentable, H: RawRepresentable, I: RawRepresentable, J: RawRepresentable
    >: RawRepresentable
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String,
          F.RawValue == String, G.RawValue == String, H.RawValue == String, I.RawValue == String, J.RawValue == String
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
    public static func element(_ value: I) -> Self { .init(rawValue: value.rawValue) }
    public static func element(_ value: J) -> Self { .init(rawValue: value.rawValue) }
}

public typealias ElementSet2<A: RawRepresentable, B: RawRepresentable>
    = ElementSet<A, B, Never, Never, Never, Never, Never, Never, Never, Never>
    where A.RawValue == String, B.RawValue == String

public typealias ElementSet3<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable>
    = ElementSet<A, B, C, Never, Never, Never, Never, Never, Never, Never>
    where A.RawValue == String, B.RawValue == String, C.RawValue == String

public typealias ElementSet4<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable>
    = ElementSet<A, B, C, D, Never, Never, Never, Never, Never, Never>
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String

public typealias ElementSet5<A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable>
    = ElementSet<A, B, C, D, E, Never, Never, Never, Never, Never>
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String

public typealias ElementSet6<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable,
    F: RawRepresentable>
    = ElementSet<A, B, C, D, E, F, Never, Never, Never, Never>
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String,
            F.RawValue == String

public typealias ElementSet7<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable,
    F: RawRepresentable, G: RawRepresentable>
    = ElementSet<A, B, C, D, E, F, G, Never, Never, Never>
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String,
          F.RawValue == String, G.RawValue == String

public typealias ElementSet8<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable,
    F: RawRepresentable, G: RawRepresentable, H: RawRepresentable
    >
    = ElementSet<A, B, C, D, E, F, G, H, Never, Never>
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String,
          F.RawValue == String, G.RawValue == String, H.RawValue == String

public typealias ElementSet9<
    A: RawRepresentable, B: RawRepresentable, C: RawRepresentable, D: RawRepresentable, E: RawRepresentable,
    F: RawRepresentable, G: RawRepresentable, H: RawRepresentable, I: RawRepresentable
    >
    = ElementSet<A, B, C, D, E, F, G, H, I, Never>
    where A.RawValue == String, B.RawValue == String, C.RawValue == String, D.RawValue == String, E.RawValue == String,
          F.RawValue == String, G.RawValue == String, H.RawValue == String, I.RawValue == String

public typealias ElementSet10 = ElementSet
