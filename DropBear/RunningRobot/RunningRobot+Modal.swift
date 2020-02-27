public protocol ModalRobotTree: RobotTree {
    associatedtype Tree: RobotTree
    associatedtype Context: RobotContext
    associatedtype Current: Robot
    associatedtype Previous: Robot
}

public enum Modal<Tree: RobotTree, Context: RobotContext, Current: Robot, Previous: Robot>: ModalRobotTree { }

extension RunningRobot {
    public typealias ModalRobot<Next: Robot> = RunningRobot<Configuration, Modal<Tree, Context, Current, Previous>, None, Next, Root>

    public enum ModalAction { case modal }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: ModalAction) -> ModalRobot<T> {
        return .init(configuration: configuration, current: .init(app: app), previous: .init(app: app))
    }
}

extension RunningRobot where Tree: ModalRobotTree {
    public func dismissModal(file: StaticString = #file, line: UInt = #line) -> RunningRobot<Configuration, Tree.Tree, Tree.Context, Tree.Current, Tree.Previous> {
        return .init(configuration: configuration, current: .init(app: app), previous: .init(app: app))
    }
}
