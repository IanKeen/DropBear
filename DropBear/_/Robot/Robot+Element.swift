//
//  Robot+Element.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

extension RawRepresentable where RawValue == String {
    public func element(in source: XCUIElement, hierarchy: [XCUIElement.ElementType], file: StaticString, line: UInt) -> XCUIElement {
        return source.element(identifier: rawValue, in: hierarchy, file: file, line: line)
    }
}

public struct StringElement: RawRepresentable, ExpressibleByStringLiteral {
    public let rawValue: String
    public init(rawValue: String) { self.rawValue = rawValue }
    public init(stringLiteral value: String) { self.rawValue = value }
}

