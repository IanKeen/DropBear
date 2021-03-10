//
//  Session.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit
import Foundation

class Session {
    enum State: Equatable {
        case loggedOut
        case loggedIn(Authentication)
    }

    // MARK: - Private
    static private let key = "session"
    private let storage: KeyValueStorage
    private let authenticator: Authenticator
    private let subject = PassthroughSubject<State, Never>()

    // MARK: - Public
    let publisher: AnyPublisher<State, Never>

    // MARK: - Lifecycle
    init(storage: KeyValueStorage, authenticator: Authenticator) {
        self.storage = storage
        self.authenticator = authenticator
        self.publisher = subject.eraseToAnyPublisher()
    }

    func restoreState() {
        if let stored: Authentication = storage.get(Self.key) {
            subject.send(.loggedIn(stored))
        } else {
            subject.send(.loggedOut)
        }
    }
    func logIn(_ credentials: AuthenticationCredentials) -> AnyPublisher<Authentication, Error> {
        return authenticator
            .authenticate(credentials)
            .handleEvents(
                receiveOutput: { [weak self] value in
                    guard let self = self else { return }

                    self.storage.set(Self.key, value)
                    self.subject.send(.loggedIn(value))
                },
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }

                    switch completion {
                    case .failure:
                        self.storage.remove(Self.key)
                        self.subject.send(.loggedOut)
                    case .finished:
                        break
                    }
                }
            )
            .eraseToAnyPublisher()
    }
    func logOut() -> AnyPublisher<Void, Never> {
        return authenticator
            .unauthenticate()
            .handleEvents(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }

                switch completion {
                case .failure:
                    break
                case .finished:
                    self.storage.remove(Self.key)
                    self.subject.send(.loggedOut)
                }
            })
            .eraseToAnyPublisher()
    }
}
