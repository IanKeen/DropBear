//
//  SettingsViewModel.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine

class SettingsViewModel: ObservableObject {
    // MARK: - Outputs
    @Published private(set) var isWorking: Bool = false
    @Published private(set) var error: Once<Error> = nil

    // MARK: - Input
    @Input var logOut: Void

    // MARK: - Private
    private var bag = Set<AnyCancellable>()

    init(session: Session) {
        let tracker = ActivityTracker()
        tracker.publisher.assign(to: &$isWorking)

        _logOut
            .publisher
            .flatMapLatest(weak(self) { this, _ in
                return session
                    .logOut()
                    .routeErrors(to: this, \.error.wrappedValue)
                    .track(with: tracker)
            })
            .globalEffect(storeIn: &bag)
    }
}
