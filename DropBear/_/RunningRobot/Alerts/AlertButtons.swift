//
//  AlertButtons.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

public protocol AlertButtons: RawRepresentable {
    func buttonElement(from alert: XCUIElement) -> XCUIElement
}

extension AlertButtons where RawValue == String {
    public func buttonElement(from alert: XCUIElement) -> XCUIElement {
        return alert.buttons[rawValue]
    }
}

extension AlertButtons where RawValue == Int {
    public func buttonElement(from alert: XCUIElement) -> XCUIElement {
        return alert.buttons.element(boundBy: rawValue)
    }
}
