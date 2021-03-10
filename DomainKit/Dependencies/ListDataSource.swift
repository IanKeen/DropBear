//
//  ListDataSource.swift
//  DomainKit
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine

public struct ListItem: Codable, Equatable {
    public var title: String
    public var createdOn: Date
    public var completed: Bool

    public init(title: String, createdOn: Date, completed: Bool) {
        self.title = title
        self.createdOn = createdOn
        self.completed = completed
    }
}

public enum ListDataSourceError: Error {
    case unableToUpdate
    case unableToRetrieve
}

public protocol ListDataSource {
    func all() -> Future<[Identified<ListItem>], Error>

    func create(_ item: ListItem) -> Future<Identified<ListItem>, Error>

    func update(_ item: Identified<ListItem>) -> Future<Identified<ListItem>, Error>
}
