//
//  RobotBase.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-18.
//

import XCTest

open class RobotBase {    
    public let source: XCUIElement

    required public init(source: XCUIElement) {
        self.source = source
    }
}
