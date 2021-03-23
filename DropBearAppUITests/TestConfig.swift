//
//  TestConfig.swift
//  DropBearAppUITests
//
//  Created by Ian Keen on 2021-03-12.
//  Copyright © 2021 Mustard. All rights reserved.
//

import DomainKit
import TestKit

extension TestConfig {
    func loggedIn() -> TestConfig {
        self.keyValueStore.set("session", Authentication(token: "_token!_"))
        return self
    }
    func withItems() -> TestConfig {
        self.listDataSource = MockListDataSource(
            allResponse: .success([
                .init(id: .init(rawValue: "0"), value: .init(title: "Title 1", createdOn: .init(), completed: true))
            ])
        )
        return self
    }
}
