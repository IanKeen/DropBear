//
//  RunningRobot+Cells.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-11.
//  Copyright © 2021 Mustard. All rights reserved.
//

import XCTest

public struct CellItemLookup {
    let cell: (XCUIElement) -> XCUIElement

    public static func index(_ index: Int, file: StaticString = #file, line: UInt = #line) -> CellItemLookup {
        return .init { $0.cell(index, file: file, line: line) }
    }
}

extension RunningRobot.NextRobotAction where Current: CellContainerRobot {
    public static func cell(
        _ lookup: CellItemLookup,
        file: StaticString = #file, line: UInt = #line
    ) -> RunningRobot.NextRobotAction<ViewHierarchy, Next> {
        return .init(
            actions: { robot in
                let cell = lookup.cell(robot.source)
                cell.tap()
            },
            hierarchy: { robot in
                return robot.viewHierarchy
            },
            next: Next.init
        )
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
