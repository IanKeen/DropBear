//
//  UITestConfiguration.swift
//  DomainKit
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DomainKit
import DropBearSupport

public typealias TestConfig = TestConfiguration<DropBearTestConfiguration>

public struct DropBearTestConfiguration: TestConfigurationSource {
    public var authenticator = MockAuthenticator()
    public var keyValueStore = MockKeyValueStorage()
    public var listDataSource = MockListDataSource()

    public var itemDetailPresentationMode: PresentationMode = .push

    public init() { }
}
