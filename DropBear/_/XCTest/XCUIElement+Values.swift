//
//  XCUIElement+Values.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension XCUIElement {
    public var values: [String] {
        var potentials = [label, value as Any]

        switch elementType {
        case .segmentedControl:
            potentials.append(contentsOf: buttons.allElementsBoundByIndex
                .filter({ $0.isSelected })
                .flatMap({ [$0.label, $0.value as Any] })
            )

        case .alert:
            potentials.append(contentsOf: staticTexts.allElementsBoundByIndex
                .flatMap({ [$0.label, $0.value as Any] })
            )

        default:
            break
        }

        return potentials.compactMap({ $0 as? String }).deduplicate().filter({ !$0.isEmpty })
    }
}

extension Collection where Element: Hashable {
    func deduplicate() -> [Element] {
        var result: [Element] = []
        result.reserveCapacity(count)

        var elements: Set<Element> = []
        for element in self {
            if elements.insert(element).inserted {
                result.append(element)
            }
        }

        return result
    }
}
