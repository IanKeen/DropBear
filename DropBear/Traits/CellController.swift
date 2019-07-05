import XCTest

public protocol CellController { }

extension RunningRobot where Current: CellController {
    public func nextRobot<T: Robot>(forCell index: Int, file: StaticString = #file, line: UInt = #line) -> NextRobot<T> {
        _ = current.tap(cell: index, file: file, line: line)
        return nextRobot()
    }
}

extension Robot where Self: CellController {
    public func tap(cell row: Int, file: StaticString = #file, line: UInt = #line) -> Self {
        cell(row, file: file, line: line).tap()
        return self
    }

    public func cell(_ row: Int, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
        let firstCell = app.cells.firstMatch
        if !firstCell.exists { _ = firstCell.waitForExistence(timeout: DropBear.defaultWaitTime) }

        guard app.cells.count > 0 else {
            XCTFail("No cells found", file: file, line: line)
            return MissingXCUIElement(element: app.firstMatch)
        }
        guard row > -1 && row < app.cells.count else {
            XCTFail("Invalid cell index. Value should be between 0 and \(app.cells.count - 1)", file: file, line: line)
            return MissingXCUIElement(element: app.firstMatch)
        }
        return app.cells.element(boundBy: row)
    }
}
