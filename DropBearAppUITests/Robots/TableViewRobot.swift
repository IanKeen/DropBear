import DropBear

class TableViewRobot: RobotBase, Robot, CellController {
    typealias Container = Containers.NavigationController
}

extension RunningRobot where Current == TableViewRobot {
    func tapCell() -> RunningRobot {
        _ = current.tap(cell: 55)
        return self
    }
}
