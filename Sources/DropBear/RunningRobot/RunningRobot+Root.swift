extension RunningRobot {
    public typealias RootRobot<Next: Robot> = RunningRobot<Configuration, NoContext, Next, Root>
    
    public enum RootAction { case root }

    public func nextRobot<Next: Robot>(_: Next.Type = Next.self, action: RootAction) -> RootRobot<Next> {
        return RootRobot(configuration: configuration, context: .init(), current: .init(source: source), previous: .init(source: source))
    }
}
