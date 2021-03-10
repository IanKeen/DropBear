//
//  Authenticator.swift
//  DomainKit
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine

public struct AuthenticationCredentials: Equatable, Codable {
    public var username: String
    public var password: String

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

public struct Authentication: Equatable, Codable {
    public var token: String

    public init(token: String) {
        self.token = token
    }
}

public enum AuthenticationError: Error {
    case invalidAuthenticationCredentials
}

public protocol Authenticator {
    func authenticate(_ credentials: AuthenticationCredentials) -> Future<Authentication, Error>

    func unauthenticate() -> Future<Void, Never>
}
