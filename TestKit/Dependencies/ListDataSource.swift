//
//  ListDataSource.swift
//  TestKit
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

public class MockListDataSource: ListDataSource, Codable {
    private var data: [Identified<ListItem>] = []
    private var allResponse: Result<[Identified<ListItem>], MockError>
    private var createResponse: Result<Identifier<ListItem>, MockError>
    private var updateResponse: Result<MockVoid, MockError>

    public init(
        allResponse: Result<[Identified<ListItem>], MockError> = .success([]),
        createResponse: Result<Identifier<ListItem>, MockError> = .success(.init(rawValue: "new")),
        updateResponse: Result<Void, MockError> = .success
    ) {
        self.allResponse = allResponse
        self.createResponse = createResponse
        self.updateResponse = updateResponse.mock
    }

    public func all() -> Future<[Identified<ListItem>], Error> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                switch self.allResponse {
                case .success(let items):
                    self.data = items
                    promise(.success(items))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
    public func create(_ item: ListItem) -> Future<Identified<ListItem>, Error> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                switch self.createResponse {
                case .success(let id):
                    let value = Identified<ListItem>(id: id, value: item)
                    self.data.append(value)
                    promise(.success(value))

                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
    public func update(_ item: Identified<ListItem>) -> Future<Identified<ListItem>, Error> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                switch self.updateResponse {
                case .success:
                    guard let index = self.data.firstIndex(where: { $0.id == item.id }) else {
                        fatalError("Attempting to update item that doesn't exist")
                    }
                    self.data[index] = item
                    promise(.success(item))

                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
}
