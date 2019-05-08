import XCTest

public typealias TableViewControllerRobot = CellControllerRobot
public typealias CollectionViewControllerRobot = CellControllerRobot

public protocol CellControllerRobot: Robot { }

extension CellControllerRobot {
    public func tap(cell row: Int, file: StaticString = #file, line: UInt = #line) -> Self {
        cell(row, file: file, line: line).tap()
        return self
    }
    
    public func makeRobot<T: RunningRobotType>(forCell row: Int, file: StaticString = #file, line: UInt = #line) -> T where T.PreviousType == Self {
        cell(row, file: file, line: line).tap()
        return T(app: app, previous: self)
    }

    public func cell(_ row: Int, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
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
