//
//  Authenticator.swift
//  TestKit
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

public class MockAuthenticator: Authenticator, Codable {
    private let result: Result<Authentication, MockError>

    public init(_ result: Result<Authentication, Error>) {
        self.result = result.mock
    }

    public func authenticate(_ credentials: AuthenticationCredentials) -> Future<Authentication, Error> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                promise(self.result.erase)
            }
        }
    }

    public func unauthenticate() -> Future<Void, Never> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                promise(.success(()))
            }
        }
    }
}
