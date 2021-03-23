//
//  Robot+Text.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension Robot where Self: Actionable {
    public func type(
        _ text: String, in element: Element, hierarchy: [XCUIElement.ElementType] = [.any],
        tapFirst: Bool = true, clearFirst: Bool = true,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let element = element.element(in: source, hierarchy: hierarchy, file: file, line: line)
        if tapFirst { element.tap() }
        if clearFirst { element.clearText(file: file, line: line) }
        element.typeText(text)

        return self
    }

    public func clearText(
        _ element: Element, in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element
            .element(in: source, hierarchy: hierarchy, file: file, line: line)
            .clearText(file: file, line: line)

        return self
    }
}

extension Robot where Self: Actionable {
    @available(*, deprecated, message: "Please use type(_:in:) instead")
    public func type(
        _ element: Element, in hierarchy: [XCUIElement.ElementType] = [.any], text: String,
        tapFirst: Bool = true, clearFirst: Bool = true,
        file: StaticString = #file, line: UInt = #line
    ) -> Self
    {
        return type(text, in: element, hierarchy: hierarchy, tapFirst: tapFirst, clearFirst: clearFirst, file: file, line: line)
    }
}
