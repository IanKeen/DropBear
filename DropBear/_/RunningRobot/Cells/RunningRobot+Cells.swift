//
//  RunningRobot+Cells.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-11.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

extension RunningRobot where Current: CellContainerRobot {
    public struct CellItemLookup {
        let cell: (XCUIElement) -> XCUIElement

        public static func index(_ index: Int, file: StaticString = #file, line: UInt = #line) -> CellItemLookup {
            return .init { $0.cell(index, file: file, line: line) }
        }
    }

    public struct CellItemAction<Hierarchy, Next: Robot> {
        let lookup: CellItemLookup
        let action: NextRobotAction<Hierarchy, Next>

        public static func cell(_ lookup: CellItemLookup, _ action: NextRobotAction<Hierarchy, Next>) -> CellItemAction {
            return .init(lookup: lookup, action: action)
        }
    }

    public func nextRobot<Hierarchy, Next: Robot>(
        _: Next.Type = Next.self,
        action: CellItemAction<Hierarchy, Next>
    ) -> RunningRobot<Configuration, Hierarchy, Next> {
        let cell = action.lookup.cell(source)
        cell.tap()
        let action = action.action
        return .init(app: app, configuration: configuration, viewHierarchy: action.hierarchy(self), current: action.next(self))
    }
}

extension RunningRobot where Current: CellContainerRobot, Current.CellItem: Robot {
    public func cell(_ lookup: CellItemLookup, file: StaticString = #file, line: UInt = #line, _ closure: (AnyRobot<Current.CellItem>) -> Void) -> Self {
        let cell = lookup.cell(source)
        closure(.init(source: cell))
        return self
    }
}

extension RunningRobot where Current: CellContainerRobot, Current.CellItem == AnyCellItem {
    public func cell<Next: Robot>(_: Next.Type = Next.self, _ lookup: CellItemLookup, file: StaticString = #file, line: UInt = #line, _ closure: (AnyRobot<Next>) -> Void) -> Self {
        let cell = lookup.cell(source)
        closure(.init(source: cell))
        return self
    }
}
