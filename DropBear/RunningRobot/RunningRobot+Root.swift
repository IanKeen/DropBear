public struct None: RobotContext { }

extension RunningRobot {
    public typealias RootRobot<Current: Robot> = RunningRobot<Configuration, None, Current, Root>
    
    public enum RootAction { case root }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: RootAction) -> RootRobot<T> {
        return RootRobot(configuration: configuration, context: .init(), current: .init(source: source), previous: .init(source: source))
    }
}
