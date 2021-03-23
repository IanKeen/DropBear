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
    ViewHierarchy,
    Current: Robot
>: Robot {
    public typealias Element = Current.Element

    public let app: XCUIApplication
    public var source: XCUIElement { return current.source }

    public let configuration: TestConfiguration<Configuration>
    public let viewHierarchy: ViewHierarchy
    public let current: Current

    public required init(app: XCUIApplication, configuration: TestConfiguration<Configuration>, viewHierarchy: ViewHierarchy, current: Current) {
        self.app = app
        self.configuration = configuration
        self.viewHierarchy = viewHierarchy
        self.current = current
    }

    public required convenience init(source: XCUIElement) {
        fatalError("This Robot can not be created this way")
    }
}

extension RunningRobot {
    public struct NextRobotAction<Hierarchy, Next: Robot> {
        let hierarchy: (RunningRobot) -> Hierarchy
        let next: (RunningRobot) -> Next
    }

    public func nextRobot<Hierarchy, Next: Robot>(
        _: Next.Type = Next.self,
        action: NextRobotAction<Hierarchy, Next>
    ) -> RunningRobot<Configuration, Hierarchy, Next> {
        return .init(app: app, configuration: configuration, viewHierarchy: action.hierarchy(self), current: action.next(self))
    }
}
extension RunningRobot.NextRobotAction {
    public init(hierarchy: @escaping (RunningRobot) -> Hierarchy, next: @escaping (XCUIElement) -> Next) {
        self.init(hierarchy: hierarchy, next: { next($0.source) })
    }

    public init(hierarchy: Hierarchy, next: @escaping (XCUIElement) -> Next) {
        self.init(hierarchy: { _ in hierarchy }, next: { next($0.source) })
    }
}

extension RunningRobot: Assertable where Current: Assertable { }
extension RunningRobot: Actionable where Current: Actionable { }
