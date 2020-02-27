public enum None: RobotContext { }

extension RunningRobot {
    public typealias RootRobot<Current: Robot> = RunningRobot<Configuration, Tree, None, Current, Root>
    
    public enum RootAction { case root }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: RootAction) -> RootRobot<T> {
        return RootRobot(configuration: configuration, current: .init(app: app), previous: .init(app: app))
    }
}
