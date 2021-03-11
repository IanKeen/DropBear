//
//  Robot+Slider.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension Robot where Self: Actionable {
    public func adjust(
        _ element: Element, in hierarchy: [XCUIElement.ElementType] = [.any],
        to position: CGFloat,
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element
            .element(in: source, hierarchy: hierarchy, file: file, line: line)
            .adjust(toNormalizedSliderPosition: position)

        return self
    }
}
