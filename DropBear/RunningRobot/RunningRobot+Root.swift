public enum None: RobotContext { }

extension RunningRobot {
    public typealias RootRobot<Current: Robot> = RunningRobot<None, Current, Root>
    
    public enum RootAction { case root }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: RootAction) -> RootRobot<T> {
        return RootRobot(current: .init(app: app), previous: .init(app: app))
    }
}
