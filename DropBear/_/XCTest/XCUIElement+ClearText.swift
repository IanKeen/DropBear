//
//  XCUIElement+ClearText.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension XCUIElement {
    /// Clears the text from the element
    public func clearText(file: StaticString = #file, line: UInt = #line) {
        guard let anyValue = value else { return }

        guard let value = anyValue as? String else {
            return XCTFail("Element \(identifier) does not hold text", file: file, line: line)
        }

        // Placeholder check is a workaround for: http://www.openradar.me/34505268
        if !value.isEmpty, value != placeholderValue {
            typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: value.count))
        }
    }
}
