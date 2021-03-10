//
//  AnyCodingKey.swift
//  DomainKit
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

public struct AnyCodingKey: CodingKey, Equatable {
    public var stringValue: String
    public var intValue: Int?

    public init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "\(intValue)"
    }
    public init?(stringValue: String) {
        self.intValue = nil
        self.stringValue = stringValue
    }
}

extension AnyCodingKey {
    public init<T: CodingKey>(_ key: T) {
        self.stringValue = key.stringValue
        self.intValue = key.intValue
    }
    public init(_ int: Int) {
        self.init(intValue: int)!
    }
    public init(_ string: String) {
        self.init(stringValue: string)!
    }
}

extension AnyCodingKey: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) { self.init(value) }
}

extension AnyCodingKey: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) { self.init(value) }
}
