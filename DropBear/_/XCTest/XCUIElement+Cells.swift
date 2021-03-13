//
//  XCUIElement+Cells.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-11.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

extension XCUIElement {
    public func cell(_ index: Int, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
        if self.cells.count == 0 {
            XCTFail("No cells found", file: file, line: line)
        }

        if index < 0 || index >= self.cells.count {
            XCTFail("Invalid cell index. Value should be between 0 and \(self.cells.count - 1)", file: file, line: line)
        }

        return self.cells.element(boundBy: index)
    }
}
