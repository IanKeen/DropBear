//
//  Result+Codable.swift
//  TestKit
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

extension Result: Codable where Success: Codable, Failure: Codable {
    public init(from decoder: Decoder) throws {
        if let value = try? Success(from: decoder) {
            self = .success(value)
        } else if let error = try? Failure(from: decoder) {
            self = .failure(error)
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Unable to decode"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .success(let value):
            try value.encode(to: encoder)
        case .failure(let error):
            try error.encode(to: encoder)
        }
    }
}
