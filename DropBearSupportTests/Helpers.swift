//
//  Helpers.swift
//  DropBearSupportTests
//
//  Created by Ian Keen on 2021-03-03.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

extension Encodable {
    func dictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        return try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    }

    func pretty() throws -> String {
        return try String(data: JSONSerialization.data(withJSONObject: dictionary(), options: .prettyPrinted), encoding: .utf8) ?? ""
    }
}

extension Dictionary {
    subscript<T>(path path: [Key]) -> T? {
        guard let key = path.first else { return nil }

        if path.count > 1 {
            return (self[key] as? [Key: Value])?[path: Array(path.dropFirst())]
        } else {
            return self[key] as? T
        }
    }
}
