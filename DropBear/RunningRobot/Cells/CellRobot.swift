import XCTest

extension RunningRobot where Current: CellContainerRobot {
    public func cell<Cell: Robot, T>(_: Cell.Type, atIndex index: Int, file: StaticString = #file, line: UInt = #line, closure: (CellRobot<Cell>) -> T) -> Self {
        let cell = self.cell(index, file: file, line: line)
        let cellRobot = CellRobot<Cell>(source: cell)
        _ = closure(cellRobot)
        return self
    }
}

public class CellRobot<Cell: Robot>: RestrictedRobotBase, Robot, Assertable, Actionable {
    public typealias Element = Cell.Element
}
