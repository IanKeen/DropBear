//
//  Context+Any.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-18.
//

extension TestRobot {
    public typealias AnyRobot<Next: Robot> = TestRobot<Configuration, NoContext, _AnyRobot<Next, Next.Element>>

    public func next<Next: Robot>(_: Next.Type) -> AnyRobot<Next> {
        .init(configuration: configuration, context: NoContext(), current: .init(base: .init(source: current.base.source)))
    }
    public func next<Next: Robot>() -> AnyRobot<Next> {
        next(Next.self)
    }
}
