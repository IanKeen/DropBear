//
//  RunningRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest
import DropBearSupport

public class RunningRobot<
    Configuration: TestConfigurationSource,
    ViewHierarchyContext,
    Current: Robot,
    Previous: Robot
>: Robot {
    public typealias Element = Current.Element

    public let app: XCUIApplication
    public var source: XCUIElement { return current.source }

    public let configuration: TestConfiguration<Configuration>
    public let viewHierarchy: ViewHierarchyContext
    public let current: Current
    public let previous: Previous

    public required init(app: XCUIApplication, configuration: TestConfiguration<Configuration>, viewHierarchy: ViewHierarchyContext, current: Current, previous: Previous) {
        self.app = app
        self.configuration = configuration
        self.viewHierarchy = viewHierarchy
        self.current = current
        self.previous = previous
    }

    public required convenience init(source: XCUIElement) {
        fatalError("This Robot can not be created this way")
    }
}

extension RunningRobot: Assertable where Current: Assertable { }
