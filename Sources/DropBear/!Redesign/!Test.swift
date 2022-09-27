//
//  File.swift
//
//
//  Created by Ian Keen on 2022-08-18.
//

import XCTest

//extension RobotBase where Self: Robot {
//
//}

//struct CustomConfig: Equatable {
//    var value: String = "hello"
//}
//
//extension TestRobot where Current.Content == BRobot, Configuration == CustomConfig {
//    func printValue() -> Self {
//        print(configuration.value)
//        return self
//    }
//}
//
final class ARobot: RobotBase, Robot {
    enum Element: String { case a_foo, a_bar }
}
//extension TestRobot where Current == ARobot {
//    func pushB() -> NavigationRobot<BRobot> { next() }
//    func showC() -> AnyRobot<CRobot> { next() }
//    func presentC() -> ModalRobot<CRobot> { next() }
//}
//
//final class BRobot: RobotBase, Robot { }
//final class CRobot: RobotBase, Robot {
//    enum Element: String { case c_foo, c_bar, c_qux }
//}
//

enum Extras: String {
    case hello, world
}
enum New: String {
    case newOne, newTwo
}
enum More: String {
    case more1, more2
}


extension ElementAssertion {
    public static var always: ElementAssertion {
        .init(name: "", assertion: { _ in true })
    }
}


/*
extension TestRobot {
    public func popElements<A, B>() -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet1<A>>>
    where Current.Element == ElementSet2<A, B>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func popElements<A, B, C>() -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet2<A, B>>>
    where Current.Element == ElementSet3<A, B, C>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func popElements<A, B, C, D>() -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet3<A, B, C>>>
    where Current.Element == ElementSet4<A, B, C, D>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func popElements<A, B, C, D, E>() -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet4<A, B, C, D>>>
    where Current.Element == ElementSet5<A, B, C, D, E>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func popElements<A, B, C, D, E, F>() -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet5<A, B, C, D, E>>>
    where Current.Element == ElementSet6<A, B, C, D, E, F>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func popElements<A, B, C, D, E, F, G>() -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet6<A, B, C, D, E, F>>>
    where Current.Element == ElementSet7<A, B, C, D, E, F, G>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }

    public func popElements<A, B, C, D, E, F, G, H>() -> TestRobot<Configuration, Context, _AnyRobot<Current.Base, ElementSet7<A, B, C, D, E, F, G>>>
    where Current.Element == ElementSet8<A, B, C, D, E, F, G, H>
    {
        .init(configuration: configuration, context: context, current: .init(base: .init(source: current.base.source)))
    }
}
*/

struct Box<Values: _ValueSet> { }

protocol _ValueSet {
    associatedtype A
    associatedtype B
    associatedtype C
}
enum ValueSet<A, B, C>: _ValueSet { }

typealias ValueSet1<A: RawRepresentable> = ValueSet<A, Never, Never> where A.RawValue == String
typealias ValueSet2<A: RawRepresentable, B: RawRepresentable> = ValueSet<A, B, Never> where A.RawValue == String, B.RawValue == String
typealias ValueSet3 = ValueSet

extension Box {
    static func start<A>(with _: A.Type) -> Box<ValueSet1<A>> where Values == ValueSet1<A> { .init() }
}

extension Box where Values.A: RawRepresentable, Values.A.RawValue == String {
    @discardableResult func use(_ value: Values.A) -> Self { self }
}
extension Box where Values.B: RawRepresentable, Values.B.RawValue == String {
    @discardableResult func use(_ value: Values.B) -> Self { self }
}
extension Box where Values.C: RawRepresentable, Values.C.RawValue == String {
    @discardableResult func use(_ value: Values.C) -> Self { self }
}

extension Box where Values.B == Never, Values.C == Never {
    func push<New>(_: New.Type) -> Box<ValueSet2<Values.A, New>> { .init() }
}
extension Box where Values.B: RawRepresentable, Values.C == Never {
    func push<New: RawRepresentable>(_: New.Type) -> Box<ValueSet3<Values.A, Values.B, New>> where New.RawValue == String { .init() }
}
extension Box where Values.C: RawRepresentable {
    func pop() -> Box<ValueSet<Values.A, Values.B, Never>> { .init() }
}
extension Box where Values.C == Never, Values.B: RawRepresentable {
    func pop() -> Box<ValueSet<Values.A, Never, Never>> { .init() }
}


enum AValue: String { case a1, a2 }
enum BValue: String { case b1, b2 }
enum CValue: String { case c1, c2 }

func madness() {
    Box
        .start(with: AValue.self)
        .use(.a1)
//        .use(.b1) // Type 'AValue' has no member 'b1'
//        .use(.c1) // Type 'AValue' has no member 'c1'
        .push(BValue.self)
        .use(.a1)
        .use(.b1)
//        .use(.c1) // Reference to member 'c1' cannot be resolved without a contextual type
        .push(CValue.self)
        .use(.a1)
        .use(.b1)
        .use(.c1)
        .pop()
        .use(.a1)
        .use(.b1)
//        .use(.c1) // Reference to member 'c1' cannot be resolved without a contextual type
        .pop()
        .use(.a1)
//        .use(.b1) // Type 'AValue' has no member 'b1'
//        .use(.c1) // Type 'AValue' has no member 'c1'
}


//func test() {
//    let x = ARobot.launch()             //TestRobot<NoConfiguration, NoContext, _AnyRobot<ARobot, ElementSet<ARobot.Element, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement>>>
//        .assert(.a_bar, .always)
//        .pushElements(Extras.self)      //TestRobot<NoConfiguration, NoContext, _AnyRobot<ARobot, ElementSet<ARobot.Element, Extras, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement>>>
//        .assert(.a_bar, .always)
//        .assert(.hello, .always)
//        .pushElements(New.self)         //TestRobot<NoConfiguration, NoContext, _AnyRobot<ARobot, ElementSet<ARobot.Element, Extras, New, NoElement, NoElement, NoElement, NoElement, NoElement>>>
//        .pushElements(More.self)        //TestRobot<NoConfiguration, NoContext, _AnyRobot<ARobot, ElementSet<ARobot.Element, Extras, New, More, NoElement, NoElement, NoElement, NoElement>>>
//        .assert(.more1, .always)
//        .popElements()                  //TestRobot<NoConfiguration, NoContext, _AnyRobot<ARobot, ElementSet<ARobot.Element, Extras, New, NoElement, NoElement, NoElement, NoElement, NoElement>>>
//        .popElements()                  //TestRobot<NoConfiguration, NoContext, _AnyRobot<ARobot, ElementSet<ARobot.Element, Extras, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement>>>
//        .popElements()                  //TestRobot<NoConfiguration, NoContext, _AnyRobot<ARobot, ElementSet<ARobot.Element, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement, NoElement>>>
//        .assert(.a_bar, .always)
////        .current
////        .assert(.hello, .always)
//}
