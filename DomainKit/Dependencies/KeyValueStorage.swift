//
//  KeyValueStorage.swift
//  DomainKit
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

public protocol KeyValueStorage {
    func get<T: Codable>(_ key: String) -> T?

    func set<T: Codable>(_ key: String, _ value: T)

    func remove(_ key: String)

    func removeAll()
}
