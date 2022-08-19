extension _RunningRobot {
    public typealias RootRobot<Next: _Robot> = _RunningRobot<Configuration, _NoContext, Next, _Root>
    
    public enum RootAction { case root }

    public func nextRobot<Next: _Robot>(_: Next.Type = Next.self, action: RootAction) -> RootRobot<Next> {
        return RootRobot(configuration: configuration, context: .init(), current: .init(source: source), previous: .init(source: source))
    }
}
