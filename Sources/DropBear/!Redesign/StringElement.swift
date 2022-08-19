//
//  StringElement.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-18.
//

public struct StringElement: RawRepresentable, ExpressibleByStringLiteral {
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    public init(stringLiteral value: String) {
        self.rawValue = value
    }
}
