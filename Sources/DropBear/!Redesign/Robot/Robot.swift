//
//  Robot.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-18.
//

import XCTest

public protocol Robot {
    associatedtype Element: RawRepresentable = StringElement where Element.RawValue == String

    var source: XCUIElement { get }

    init(source: XCUIElement)
}
