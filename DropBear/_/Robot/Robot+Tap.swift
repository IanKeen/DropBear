//
//  Robot+Tap.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension Robot where Self: Actionable {
    public func tap(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        numberOfTaps: Int = 1, numberOfTouches: Int = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element
            .element(in: source, hierarchy: hierarchy, file: file, line: line)
            .tap(withNumberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches)

        return self
    }

    public func tap(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        index: Int,
        numberOfTaps: Int = 1, numberOfTouches: Int = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element
            .element(in: source, hierarchy: hierarchy, file: file, line: line)
            .buttons.element(boundBy: index)
            .tap(withNumberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches)

        return self
    }

    public func press(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        duration: TimeInterval = 1,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element
            .element(in: source, hierarchy: hierarchy, file: file, line: line)
            .press(forDuration: duration)

        return self
    }

    public func press(
        _ element: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        duration: TimeInterval = 1,
        dragTo other: Element,
        in otherHierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        let element = element.element(in: source, hierarchy: hierarchy, file: file, line: line)
        let destination = other.element(in: source, hierarchy: hierarchy, file: file, line: line)
        element.press(forDuration: duration, thenDragTo: destination)

        return self
    }
}
