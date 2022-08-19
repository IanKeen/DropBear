//
//  TestRobot+ElementSet.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-19.
//

extension TestRobot {
    public func replaceElements<New: RawRepresentable>(_: New.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, New>> {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }
}

extension TestRobot {
    public func appendElements<New: RawRepresentable>(_: New.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet2<Current.Element, New>>> {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }
    
    public func appendElements<A, B, New: RawRepresentable>(
        _: New.Type
    ) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet3<A, B, New>>>
    where Current.Element == ElementSet2<A, B>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func appendElements<A, B, C, New: RawRepresentable>(
        _: New.Type
    ) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet4<A, B, C, New>>>
    where Current.Element == ElementSet3<A, B, C>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func appendElements<A, B, C, D, New: RawRepresentable>(
        _: New.Type
    ) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet5<A, B, C, D, New>>>
    where Current.Element == ElementSet4<A, B, C, D>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func appendElements<A, B, C, D, E, New: RawRepresentable>(
        _: New.Type
    ) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet6<A, B, C, D, E, New>>>
    where Current.Element == ElementSet5<A, B, C, D, E>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func appendElements<A, B, C, D, E, F, New: RawRepresentable>(
        _: New.Type
    ) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet7<A, B, C, D, E, F, New>>>
    where Current.Element == ElementSet6<A, B, C, D, E, F>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func appendElements<A, B, C, D, E, F, G, New: RawRepresentable>(
        _: New.Type
    ) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet8<A, B, C, D, E, F, G, New>>>
    where Current.Element == ElementSet7<A, B, C, D, E, F, G>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }
}


extension TestRobot {
    @discardableResult
    public func assert<A, B, C, D, E, F, G, H>(_ value: A) -> Self
    where Current.Element == ElementSet<A, B, C, D, E, F, G, H>
    {
        return self
    }
    
    @discardableResult
    public func assert<A, B, C, D, E, F, G, H>(_ value: B) -> Self
    where Current.Element == ElementSet<A, B, C, D, E, F, G, H>
    {
        return self
    }
    
    @discardableResult
    public func assert<A, B, C, D, E, F, G, H>(_ value: C) -> Self
    where Current.Element == ElementSet<A, B, C, D, E, F, G, H>
    {
        return self
    }
    
    @discardableResult
    public func assert<A, B, C, D, E, F, G, H>(_ value: D) -> Self
    where Current.Element == ElementSet<A, B, C, D, E, F, G, H>
    {
        return self
    }
    
    @discardableResult
    public func assert<A, B, C, D, E, F, G, H>(_ value: E) -> Self
    where Current.Element == ElementSet<A, B, C, D, E, F, G, H>
    {
        return self
    }
    
    @discardableResult
    public func assert<A, B, C, D, E, F, G, H>(_ value: F) -> Self
    where Current.Element == ElementSet<A, B, C, D, E, F, G, H>
    {
        return self
    }
    
    @discardableResult
    public func assert<A, B, C, D, E, F, G, H>(_ value: G) -> Self
    where Current.Element == ElementSet<A, B, C, D, E, F, G, H>
    {
        return self
    }
    
    @discardableResult
    public func assert<A, B, C, D, E, F, G, H>(_ value: H) -> Self
    where Current.Element == ElementSet<A, B, C, D, E, F, G, H>
    {
        return self
    }
}
