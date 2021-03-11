//
//  Robot+Assert.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension Robot where Self: Assertable {
    // MARK: - Single Element Assertions

    @discardableResult
    public func assert(
        _ element: Element, in hierarchy: [XCUIElement.ElementType] = [.any], _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(element, in: hierarchy, [assertion] + rest, file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ element: Element, in hierarchy: [XCUIElement.ElementType] = [.any], _ assertions: [ElementAssertion],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert([element], in: hierarchy, assertions, file: file, line: line)
    }

    // MARK: - Multi Element Assertions

    @discardableResult
    public func assert(
        _ elements: [Element], in hierarchy: [XCUIElement.ElementType] = [.any], _ assertion: ElementAssertion, _ rest: ElementAssertion...,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        return assert(elements, in: hierarchy, [assertion] + rest, file: file, line: line)
    }

    @discardableResult
    public func assert(
        _ elements: [Element], in hierarchy: [XCUIElement.ElementType] = [.any], _ assertions: [ElementAssertion],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let allElements = elements.map { $0.element(in: source, hierarchy: hierarchy, file: file, line: line) }

        for element in allElements {
            element.assert(assertions, file: file, line: line)
        }

        return self
    }
}
