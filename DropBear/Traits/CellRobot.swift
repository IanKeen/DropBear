import XCTest

extension RunningRobot where Current: CellContainerRobot {
    public func cell<T: Robot, U>(_: T.Type, atIndex index: Int, file: StaticString = #file, line: UInt = #line, closure: (CellRobot<T>) -> U) -> Self {
        let cell = self.cell(index, file: file, line: line)
        let cellRobot = CellRobot<T>(source: cell)
        _ = closure(cellRobot)
        return self
    }
}

public class CellRobot<Cell: Robot>: RestrictedRobotBase, Robot, Assertable, Actionable {
    public typealias Element = Cell.Element
}
