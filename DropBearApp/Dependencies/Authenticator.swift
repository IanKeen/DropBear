//
//  Authenticator.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

class LiveAuthenticator: Authenticator {
    func authenticate(_ credentials: AuthenticationCredentials) -> Future<Authentication, Error> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
                switch Int.random(in: 1...10) {
                case 1,3,7:
                    promise(.failure(AuthenticationError.invalidAuthenticationCredentials))
                default:
                    promise(.success(.init(token: UUID().uuidString)))
                }
            }
        }
    }

    func unauthenticate() -> Future<Void, Never> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
                promise(.success(()))
            }
        }
    }
}

