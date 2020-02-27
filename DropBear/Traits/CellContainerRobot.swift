import XCTest

public protocol CellContainerRobot: Robot { }

extension RunningRobot where Current: CellContainerRobot {
    public func nextRobot<T: Robot>(_: T.Type = T.self, forCell index: Int, action: RootAction, file: StaticString = #file, line: UInt = #line) -> RootRobot<T> {
        _ = current.tap(cell: index, file: file, line: line)
        return nextRobot(action: action)
    }

    public func nextRobot<T: Robot>(_: T.Type = T.self, forCell index: Int, action: NavigationAction, file: StaticString = #file, line: UInt = #line) -> NavigationRobot<T> {
        _ = current.tap(cell: index, file: file, line: line)
        return nextRobot(action: action)
    }

    public func nextRobot<T: Robot>(_: T.Type = T.self, forCell index: Int, action: ModalAction, file: StaticString = #file, line: UInt = #line) -> ModalRobot<T> {
        _ = current.tap(cell: index, file: file, line: line)
        return nextRobot(action: action)
    }
}

extension Robot where Self: CellContainerRobot {
    public func tap(cell row: Int, file: StaticString = #file, line: UInt = #line) -> Self {
        cell(row, file: file, line: line).tap()
        return self
    }

    public func cell(_ row: Int, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
        let cells = app.cells.firstMatch
        let cellsAvailable = cells.waitForExistence(timeout: DropBear.defaultWaitTime)

        if !cellsAvailable {
            XCTFail("Failed to find any cell containers", file: file, line: line)
        }

        if app.cells.count == 0 {
            XCTFail("No cells found", file: file, line: line)
        }

        if row < 0 || row >= app.cells.count {
            XCTFail("Invalid cell index. Value should be between 0 and \(app.cells.count - 1)", file: file, line: line)
        }

        return app.cells.element(boundBy: row)
    }
}
