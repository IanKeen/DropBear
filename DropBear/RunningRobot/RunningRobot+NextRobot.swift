extension RunningRobotType {
    public typealias NextRobot<Next: Robot> = RunningRobot<Next, RunningRobot<Current, Previous>>

    public func nextRobot<T: Robot>() -> NextRobot<T> {
        return NextRobot(current: .init(app: app), previous: .init(current: current, previous: previous))
    }
}
