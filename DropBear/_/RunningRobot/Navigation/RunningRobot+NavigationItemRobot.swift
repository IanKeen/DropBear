//
//  RunningRobot+NavigationItemRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-12.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

public protocol NavigationItemHierarchy {
    associatedtype NavigationElement
    associatedtype Parent
    associatedtype Root
    associatedtype Previous

    var parent: Parent { get }
    var root: Root { get }
    var previous: Previous { get }
}

public struct NavigationItem<NavigationElement, Parent, Root, Previous>: NavigationItemHierarchy {
    public let parent: Parent
    public let root: Root
    public let previous: Previous
}

extension NavigationItem: TabItemHierarchy where Parent: TabItemHierarchy {
    public var tabController: Parent.TabController { parent.tabController }
}

extension RunningRobot where ViewHierarchy: NavigationHierarchy {
    public typealias NavigationItemRobot<NavigationElement, Next: Robot> = RunningRobot<
        Configuration,
        NavigationItem<NavigationElement, ViewHierarchy, RunningRobot, RunningRobot>,
        Next
    >
}

extension RunningRobot.NextRobotAction where ViewHierarchy: NavigationHierarchy {
    /// Used to push the _next_ `Robot` on to the navigation stack
    public static var push: RunningRobot.NextRobotAction<NavigationItem<NoNavigationElement, ViewHierarchy, RunningRobot, RunningRobot>, Next> {
        return .init(hierarchy: { .init(parent: $0.viewHierarchy, root: $0, previous: $0) }, next: Next.init)
    }

    /// Used to push the _next_ `Robot` on to the navigation stack
    public static func push<T>(elements: T.Type) -> RunningRobot.NextRobotAction<NavigationItem<T, ViewHierarchy, RunningRobot, RunningRobot>, Next> {
        return .init(hierarchy: { .init(parent: $0.viewHierarchy, root: $0, previous: $0) }, next: Next.init)
    }
}

extension RunningRobot.NextRobotAction where ViewHierarchy: NavigationItemHierarchy {
    /// Used to push the _next_ `Robot` on to the navigation stack
    public static var push: RunningRobot.NextRobotAction<NavigationItem<NoNavigationElement, ViewHierarchy, ViewHierarchy.Root, RunningRobot>, Next> {
        return .init(hierarchy: { .init(parent: $0.viewHierarchy, root: $0.viewHierarchy.root, previous: $0) }, next: Next.init)
    }
}

extension RunningRobot where ViewHierarchy: NavigationItemHierarchy {
    /// Go back to the root of the navigation stack
    public func popToRoot() -> ViewHierarchy.Root {
        return viewHierarchy.root
    }

    /// Go back to the previous `Robot` in the navigation stack
    public func popNavigationController() -> ViewHierarchy.Previous {
        return viewHierarchy.previous
    }
}

//extension RunningRobot where ViewHierarchyContext: NavigationItemHierarchy {
//    public func popNavigationController(file: StaticString = #file, line: UInt = #line) -> Previous {
//        if source.navigationBars.buttons.count == 0 {
//            XCTFail("Unable to find a navigation button", file: file, line: line)
//        }
//
//        source.navigationBars.buttons.element(boundBy: 0).tap()
//
//        return previous
//    }
//}
