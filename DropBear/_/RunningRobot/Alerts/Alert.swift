//
//  Alert.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

public struct Alert<Buttons: AlertButtons> {
    public typealias Source = (_ current: XCUIElement) -> XCUIElement

    public let source: Source
    public let assertion: ElementAssertion

    public init(source: @escaping Source = { $0 }, assertion: ElementAssertion) {
        self.source = source
        self.assertion = assertion
    }
}

public protocol AlertType {
    associatedtype Buttons: AlertButtons

    var assertion: ElementAssertion { get }
}

extension Alert: AlertType { }
