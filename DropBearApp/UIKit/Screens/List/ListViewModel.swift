//
//  ListViewModel.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

class ListViewModel: ObservableObject {
    // MARK: - Output
    @Published private(set) var isWorking: Bool = false
    @Published private(set) var items: [ListItemDetailsViewModel] = []
    @Published private(set) var error: Once<Error> = nil

    // MARK: - Input
    @Input private(set) var refresh: Void

    // MARK: - Lifecycle
    init(repository: ListItemRepository) {
        let tracker = ActivityTracker()
        tracker.publisher.assign(to: &$isWorking)

        let local = _refresh
            .publisher
            .flatMapLatest(weak(self) { this, _ in
                return repository
                    .refresh()
                    .routeErrors(to: this, \.error.wrappedValue)
                    .track(with: tracker)
            })

        let global = repository.publisher

        Publishers.Merge(local, global)
            .map { $0.map(ListItemDetailsViewModel.init) }
            .assign(to: &$items)
    }
}
