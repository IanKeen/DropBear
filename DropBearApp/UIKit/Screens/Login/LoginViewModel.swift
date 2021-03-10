//
//  LoginViewModel.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

class LoginViewModel: ObservableObject {
    // MARK: - Output
    @Published private(set) var isWorking: Bool = false
    @Published private(set) var allowLogin: Bool = false
    @Published private(set) var error: Once<Error> = nil

    // MARK: - Input
    @Input private(set) var username: String
    @Input private(set) var password: String
    @Input private(set) var login: Void

    // MARK: - Private
    private var bag = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init(session: Session) {
        let tracker = ActivityTracker()
        tracker.publisher.assign(to: &$isWorking)

        let input = _username.publisher.combineLatest(_password.publisher)

        input
            .map { !$0.isEmpty && !$1.isEmpty }
            .assign(to: &$allowLogin)

        _login
            .publisher
            .filter($allowLogin)
            .withLatestFrom(input)
            .map(AuthenticationCredentials.init)
            .flatMapLatest(weak(self) { this, creds in
                return session
                    .logIn(creds)
                    .routeErrors(to: this, \.error.wrappedValue)
                    .track(with: tracker)
            })
            .globalEffect(storeIn: &bag)
    }
}
