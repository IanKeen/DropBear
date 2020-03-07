public protocol ModalContext: RobotContext {
    associatedtype PresenterConfiguration
    associatedtype PresenterContext: RobotContext
    associatedtype PresenterCurrent: Robot
    associatedtype PresenterPrevious: Robot

    typealias Presenter = RunningRobot<PresenterConfiguration, PresenterContext, PresenterCurrent, PresenterPrevious>

    var presenter: Presenter { get }
}

public struct Modal<PresenterConfiguration, PresenterContext: RobotContext, PresenterCurrent: Robot, PresenterPrevious: Robot>: ModalContext {
    public let presenter: Presenter
}

extension RunningRobot {
    public typealias ModalRobot<Next: Robot> = RunningRobot<Configuration, Modal<Configuration, Context, Current, Previous>, Next, Root>

    public enum ModalAction { case modal }

    public func nextRobot<T: Robot>(_: T.Type = T.self, action: ModalAction) -> ModalRobot<T> {
        return .init(configuration: configuration, context: .init(presenter: self), current: .init(source: source), previous: .init(source: source))
    }
}

extension RunningRobot where Context: ModalContext {
    public func dismissModal() -> Context.Presenter {
        return context.presenter
    }
}
