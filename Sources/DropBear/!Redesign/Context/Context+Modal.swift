//
//  Context+Modal.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-18.
//

public protocol Modal {
    associatedtype Presenter
    
    var presenter: Presenter { get }
}

public struct ModalContext<Presenter>: Modal {
    public var presenter: Presenter
}

extension TestRobot {
    public typealias ModalRobot<Next: Robot> = TestRobot<Configuration, ModalContext<Self>, _AnyRobot<Next, Next.Element>>
    
    public func present<Next: Robot>(_: Next.Type) -> ModalRobot<Next> {
        .init(configuration: configuration, context: .init(presenter: self), current: .init(base: .init(source: current.base.source)))
    }
}

extension TestRobot where Context: Modal {
    public func dismiss() -> Context.Presenter { context.presenter }
}
