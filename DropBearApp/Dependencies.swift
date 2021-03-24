//
//  Dependencies.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DomainKit

enum Dependencies {
    static var authenticator: Authenticator = LiveAuthenticator()
    static var keyValueStorage: KeyValueStorage = LiveKeyValueStorage()

    static let session = Session(
        storage: Dependencies.keyValueStorage,
        authenticator: Dependencies.authenticator
    )

    @Resetable
    static var listDataSource: ListDataSource = LiveListDataSource()

    @Resetable
    static private(set) var listItemRepository = ListItemRepository(
        dataSource: Dependencies.listDataSource
    )

    static var itemDetailPresentationMode: PresentationMode = .push

    static func reset() {
        _listDataSource.reset()
        _listItemRepository.reset()
    }
}
