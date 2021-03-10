//
//  XCUIElement+Assert.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

extension XCUIElement {
    @discardableResult
    public func assert(_ assertion: ElementAssertion, _ rest: ElementAssertion..., file: StaticString = #file, line: UInt = #line) -> Self {
        return assert([assertion] + rest, file: file, line: line)
    }

    @discardableResult
    public func assert(_ assertions: [ElementAssertion], file: StaticString = #file, line: UInt = #line) -> Self {
        var failed: [(String)] = []

        for assertion in assertions {
            switch assertion.assert(self) {
            case .success:
                break
            case .failure(let error):
                let message = "- \(assertion.name) : \(error)"
                failed.append(message)
            }
        }

        if !failed.isEmpty {
            let message = """
            The following assertion(s) on element '\(identifier)' failed:
            \(failed.joined(separator: "\n"))
            """
            XCTFail(message, file: file, line: line)
        }

        return self
    }
}
