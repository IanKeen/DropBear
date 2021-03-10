//
//  ListItemRepository.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

class ListItemRepository {
    // MARK: - Private
    private let subject = CurrentValueSubject<[Identified<ListItem>], Never>([])
    private let dataSource: ListDataSource

    // MARK: - Public
    let publisher: AnyPublisher<[Identified<ListItem>], Never>

    // MARK: - Lifecycle
    init(dataSource: ListDataSource) {
        self.dataSource = dataSource
        self.publisher = subject.eraseToAnyPublisher()
    }

    // MARK: - Public
    func refresh() -> AnyPublisher<[Identified<ListItem>], Error> {
        return dataSource
            .all()
            .map { items in
                return items.sorted(by: { $0.createdOn > $1.createdOn })
            }
            .handleEvents(receiveOutput: { [weak self] items in
                self?.subject.send(items)
            })
            .eraseToAnyPublisher()
    }
    func create(_ item: ListItem) -> AnyPublisher<Identified<ListItem>, Error> {
        return dataSource
            .create(item)
            .flatMap(weak(self) { this, item in
                this.refresh().map { _ in item }
            })
            .eraseToAnyPublisher()
    }
    func update(_ item: Identified<ListItem>) -> Future<Identified<ListItem>, Error> {
        return dataSource.update(item)
    }
}
