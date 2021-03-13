//
//  Robot+Base.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

/// A pre-made base class you can use to avoid some `Robot` boilerplate code
/// It does not conform to `Robot` so consumers are still required to do so
open class RobotBase: Launchable, Assertable, Actionable {
    public let source: XCUIElement

    public required init(source: XCUIElement) {
        self.source = source
    }
}

public class AnyRobot<Content: Robot>: Robot, Assertable, Actionable {
    public typealias Element = Content.Element

    public let source: XCUIElement

    public required init(source: XCUIElement) {
        self.source = source
    }
}

public class RestrictedRobotBase {
    public let source: XCUIElement

    public required init(source: XCUIElement) {
        self.source = source
    }
}
