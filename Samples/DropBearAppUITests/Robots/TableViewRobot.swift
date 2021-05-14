import DropBear

class TableViewRobot: RobotBase, CellContainerRobot {
    //
}

extension RunningRobot where Current == TableViewRobot {
    func tapCell() -> RunningRobot {
        _ = current.tap(cell: 12)
        return self
    }
}
