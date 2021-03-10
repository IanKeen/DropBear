//
//  XCUIElement+Element.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension XCUIElement {
    public func element(
        identifier: String,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, function: String = #function, line: UInt = #line
        ) -> XCUIElement
    {
        guard let first = hierarchy.first else {
            XCTFail("At least one hierarchy element must be provided", file: file, line: line)
            return firstMatch
        }

        let root = descendants(matching: first)
        let container = hierarchy.dropFirst().reduce(root) { $0.descendants(matching: $1) }
        return container.element(matching: .any, identifier: identifier)
    }
}
