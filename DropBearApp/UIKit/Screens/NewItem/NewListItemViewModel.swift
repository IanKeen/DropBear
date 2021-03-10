//
//  NewListItemViewModel.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

class NewListItemViewModel: ObservableObject {
    // MARK: - Output
    @Published private(set) var isWorking: Bool = false
    @Published private(set) var allowSave: Bool = false
    @Published private(set) var error: Once<Error> = nil
    @Published private(set) var didSave: Bool = false

    // MARK: - Input
    @Input private(set) var title: String
    @Input private(set) var complete: Bool
    @Input private(set) var save: Void

    // MARK: - Lifecycle
    init(repository: ListItemRepository) {
        let tracker = ActivityTracker()
        tracker.publisher.assign(to: &$isWorking)

        let input = _title.publisher.prepend("")
            .combineLatest(_complete.publisher.prepend(false))
            .map({ (title: $0, complete: $1) })

        input
            .map { !$0.title.isEmpty }
            .assign(to: &$allowSave)

        _save.publisher
            .filter($allowSave)
            .withLatestFrom(input)
            .flatMap(weak(self) { this, input in
                return repository
                    .create(.init(title: input.title, createdOn: .init(), completed: input.complete))
                    .routeErrors(to: this, \.error.wrappedValue)
                    .track(with: tracker)
            })
            .map { _ in true }
            .assign(to: &$didSave)
    }
}
