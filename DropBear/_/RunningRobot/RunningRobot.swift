//
//  RunningRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest
import DropBearSupport

public protocol RunningRobotType {
    associatedtype ViewHierarchy
    associatedtype Current: Robot

    var viewHierarchy: ViewHierarchy { get }
    var current: Current { get }
}

public class RunningRobot<
    Configuration: TestConfigurationSource,
    ViewHierarchy,
    Current: Robot
>: Robot, RunningRobotType {
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
        let actions: (RunningRobot) -> Void
        let hierarchy: (RunningRobot) -> Hierarchy
        let next: (RunningRobot) -> Next
    }

    public func nextRobot<A, Next: Robot>(
        _: Next.Type = Next.self,
        action: NextRobotAction<A, Next>,
        file: StaticString = #file, line: UInt = #line
    ) -> RunningRobot<Configuration, A, Next> {
        return apply(action)
    }

    public func nextRobot<A, B, Next: Robot>(
        _: Next.Type = Next.self,
        action: NextRobotAction<A, Current>,
        in modifier1: RunningRobot<Configuration, A, Current>.NextRobotAction<B, Next>,
        file: StaticString = #file, line: UInt = #line
    ) -> RunningRobot<Configuration, B, Next> {
        action.actions(self)

        let a = apply(action)
        let b = a.apply(modifier1)

        return b
    }
}

extension RunningRobot {
    func apply<NewHierarchy, Next>(_ action: NextRobotAction<NewHierarchy, Next>) -> RunningRobot<Configuration, NewHierarchy, Next> {
        return .init(app: app, configuration: configuration, viewHierarchy: action.hierarchy(self), current: .init(source: source))
    }
}

extension RunningRobot.NextRobotAction {
    static var unchanged: RunningRobot.NextRobotAction<ViewHierarchy, Current> {
        return .init(hierarchy: { $0.viewHierarchy }, next: Current.init)
    }

    init(actions: @escaping (RunningRobot) -> Void = { _ in }, hierarchy: @escaping (RunningRobot) -> Hierarchy, next: @escaping (XCUIElement) -> Next) {
        self.init(actions: actions, hierarchy: hierarchy, next: { next($0.source) })
    }

    init(actions: @escaping (RunningRobot) -> Void = { _ in }, hierarchy: Hierarchy, next: @escaping (XCUIElement) -> Next) {
        self.init(actions: actions, hierarchy: { _ in hierarchy }, next: { next($0.source) })
    }
}

extension RunningRobot: Assertable where Current: Assertable { }
extension RunningRobot: Actionable where Current: Actionable { }
