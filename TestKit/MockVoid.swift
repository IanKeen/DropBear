//
//  MockVoid.swift
//  TestKit
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

struct MockVoid: Equatable, Codable { }

extension Result where Success == Void {
    var mock: Result<MockVoid, Failure> { map { _ in MockVoid() } }
}

extension Result where Success == MockVoid {
    var erases: Result<Void, Failure> { map { _ in () } }
}
