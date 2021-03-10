//
//  Identifier.swift
//  DomainKit
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

public struct Identifier<T>: RawRepresentable, Hashable, Codable {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

@dynamicMemberLookup
public struct Identified<T>: Identifiable {
    public var id: Identifier<T>

    private var _value: T

    public subscript<U>(dynamicMember keyPath: KeyPath<T, U>) -> U {
        return _value[keyPath: keyPath]
    }
    public subscript<U>(dynamicMember keyPath: WritableKeyPath<T, U>) -> U {
        get { _value[keyPath: keyPath] }
        set { _value[keyPath: keyPath] = newValue }
    }
}
extension Identified {
    public init(id: Identifier<T>, value: T) {
        self.id = id
        self._value = value
    }
}

extension Identified: Equatable where T: Equatable { }
extension Identified: Hashable where T: Hashable { }

fileprivate extension Identified {
    enum CodingKeys: String, CodingKey { case id }
}

extension Identified: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try _value.encode(to: encoder)
    }
}

extension Identified: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Identifier<T>.self, forKey: .id)
        self._value = try T(from: decoder)
    }
}
