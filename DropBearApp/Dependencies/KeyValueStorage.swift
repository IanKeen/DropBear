//
//  KeyValueStorage.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

class LiveKeyValueStorage: KeyValueStorage {
    private struct Box<T: Codable>: Codable {
        var value: T
    }

    let userDefaults = UserDefaults.standard

    init() { }

    func get<T: Codable>(_ key: String) -> T? {
        guard let data = userDefaults.data(forKey: key.prefixed) else { return nil }
        return try? JSONDecoder().decode(Box<T>.self, from: data).value
    }
    func set<T: Codable>(_ key: String, _ value: T) {
        guard let data = try? JSONEncoder().encode(Box(value: value)) else { return }
        userDefaults.setValue(data, forKey: key.prefixed)
    }
    func remove(_ key: String) {
        userDefaults.removeObject(forKey: key.prefixed)
    }
    func removeAll() {
        userDefaults.dictionaryRepresentation().keys
            .filter { $0.hasPrefix(_prefix) }
            .forEach { userDefaults.removeObject(forKey: $0) }
    }
}

private let _prefix = "_dropbear_"

private extension String {
    var prefixed: String { "\(_prefix)\(self)" }
}
