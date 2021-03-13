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

extension RunningRobot {
    public struct NextRobotAction<Hierarchy, Next: Robot, Previous: Robot> {
        let hierarchy: Hierarchy
        let next: (RunningRobot) -> Next
        let previous: (RunningRobot) -> Previous
    }

    public func nextRobot<Hierarchy, Next: Robot, Previous: Robot>(
        _: Next.Type = Next.self,
        action: NextRobotAction<Hierarchy, Next, Previous>
    ) -> RunningRobot<Configuration, Hierarchy, Next, Previous> {
        return .init(app: app, configuration: configuration, viewHierarchy: action.hierarchy, current: action.next(self), previous: action.previous(self))
    }
}
extension RunningRobot.NextRobotAction {
    init(hierarchy: Hierarchy, next: @escaping (XCUIElement) -> Next, previous: @escaping (XCUIElement) -> Previous) {
        self.init(hierarchy: hierarchy, next: { next($0.source) }, previous: { previous($0.source) })
    }
}
extension RunningRobot.NextRobotAction where Previous == RunningRobot {
    init(hierarchy: Hierarchy, next: @escaping (XCUIElement) -> Next) {
        self.init(hierarchy: hierarchy, next: { next($0.source) }, previous: { $0 })
    }
}

extension RunningRobot: Assertable where Current: Assertable { }
extension RunningRobot: Actionable where Current: Actionable { }
