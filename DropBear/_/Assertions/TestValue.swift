//
//  TestValue.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

/// Represents a value provided by the user and converts it to the representation `XCUIElement`s use so they can be compared.
public protocol TestValue {
    var stringValues: [String] { get }
}

extension Bool: TestValue {
    public var stringValues: [String] {
        switch self {
        case true: return ["1"]
        case false: return ["0"]
        }
    }
}

extension TestValue where Self: LosslessStringConvertible {
    public var stringValues: [String] { return [description] }
}

extension Int: TestValue { }
extension Double: TestValue { }
extension String: TestValue { }
