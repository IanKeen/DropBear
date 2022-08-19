public protocol _ModalContext: RobotContext {
    associatedtype NavigationElement

    associatedtype PresenterConfiguration
    associatedtype PresenterContext: RobotContext
    associatedtype PresenterCurrent: _Robot
    associatedtype PresenterPrevious: _Robot

    typealias Presenter = _RunningRobot<PresenterConfiguration, PresenterContext, PresenterCurrent, PresenterPrevious>

    var presenter: Presenter { get }
}

public struct _Modal<NavigationElement, PresenterConfiguration, PresenterContext: RobotContext, PresenterCurrent: _Robot, PresenterPrevious: _Robot>: _ModalContext {
    public let presenter: Presenter
}

extension _RunningRobot {
    public typealias ModalRobot<NavigationElement, Next: _Robot> = _RunningRobot<
        Configuration,
        _Modal<NavigationElement, Configuration, Context, Current, Previous>,
        Next,
        _Root
    >

    public enum ModalAction { case modal }

    public func nextRobot<NavigationElement, Next: _Robot>(_: Next.Type = Next.self, action: ModalAction) -> ModalRobot<NavigationElement, Next> {
        return .init(configuration: configuration, context: .init(presenter: self), current: .init(source: source), previous: .init(source: source))
    }
}

extension _RunningRobot where Context: _ModalContext {
    public func dismissModal() -> Context.Presenter {
        return context.presenter
    }
}
