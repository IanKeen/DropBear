//
//  KeyValueStorage.swift
//  TestKit
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DomainKit

public class MockKeyValueStorage: KeyValueStorage, Codable {
    private var storage: [String: Data] = [:]

    public func get<T: Codable>(_ key: String) -> T? {
        guard let data = storage[key] else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    public func set<T: Codable>(_ key: String, _ value: T) {
        storage[key] = try? JSONEncoder().encode(value)
    }
    public func remove(_ key: String) {
        storage[key] = nil
    }
    public func removeAll() {
        storage = [:]
    }
}
