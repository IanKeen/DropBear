//
//  MockError.swift
//  TestKit
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

public struct MockError: LocalizedError, Codable {
    public enum Default: LocalizedError {
        case expected

        public var errorDescription: String? { "Expected" }
    }

    public var errorDescription: String?

    public init(_ error: Error = Default.expected) {
        self.errorDescription = error.localizedDescription
    }
}

extension Error {
    public var mock: MockError { .init(self) }
}

extension Result where Failure == Error {
    var mock: Result<Success, MockError> { return mapError(MockError.init) }
}
extension Result where Failure == MockError {
    var erase: Result<Success, Error> { return mapError { $0 } }
}
