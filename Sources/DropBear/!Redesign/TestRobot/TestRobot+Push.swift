////
////  TestRobot+Assert.swift
////  DropBear
////
////  Created by Ian Keen on 2022-09-26.
////
//
//import Foundation
//
//extension TestRobot {
//    public func pushElements<A, B>(_: B.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet2<A, B>>>
//    where Current.Element == ElementSet1<A>
//    {
//        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
//    }
//
//    public func pushElements<A, B, C>(_: C.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet3<A, B, C>>>
//    where Current.Element == ElementSet2<A, B>
//    {
//        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
//    }
//
//    public func pushElements<A, B, C, D>(_: D.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet4<A, B, C, D>>>
//    where Current.Element == ElementSet3<A, B, C>
//    {
//        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
//    }
//
//    public func pushElements<A, B, C, D, E>(_: E.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet5<A, B, C, D, E>>>
//    where Current.Element == ElementSet4<A, B, C, D>
//    {
//        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
//    }
//
//    public func pushElements<A, B, C, D, E, F>(_: F.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet6<A, B, C, D, E, F>>>
//    where Current.Element == ElementSet5<A, B, C, D, E>
//    {
//        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
//    }
//
//    public func pushElements<A, B, C, D, E, F, G>(_: G.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet7<A, B, C, D, E, F, G>>>
//    where Current.Element == ElementSet6<A, B, C, D, E, F>
//    {
//        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
//    }
//
//    public func pushElements<A, B, C, D, E, F, G, H>(_: H.Type) -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet8<A, B, C, D, E, F, G, H>>>
//    where Current.Element == ElementSet7<A, B, C, D, E, F, G>
//    {
//        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
//    }
//}
