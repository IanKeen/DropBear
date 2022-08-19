//
//  Context+Stack.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-18.
//

public protocol Stack {
    associatedtype Previous
    
    var previous: Previous { get }
}

public struct StackContext<Previous>: Stack {
    public var previous: Previous
}

extension TestRobot {
    public typealias NavigationRobot<Next: Robot> = TestRobot<Configuration, StackContext<Self>, _AnyRobot<Next, Next.Element>>
    
    public func push<Next: Robot>(_: Next.Type) -> NavigationRobot<Next> {
        .init(configuration: configuration, context: .init(previous: self), current: .init(base: .init(source: current.base.source)))
    }
}

extension TestRobot where Context: Stack {
    public func pop() -> Context.Previous { context.previous }
}
