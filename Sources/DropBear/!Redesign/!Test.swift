//
//  File.swift
//
//
//  Created by Ian Keen on 2022-08-18.
//

import XCTest

extension TestRobot {
    @discardableResult
    public func assert(_ value: Current.Element) -> Self {
        return self
    }
}

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

func test() {
    let x = ARobot.launch()

//        .assert(.a_bar)
//        .appendElements(Extras.self)
//        .assert(.a_foo)
//        .assert(.hello)

    
    
    
////    ARobot.launch(configuration: CustomConfig())
////        .assert(.a_bar)
////
////        .pushB()
////        .printValue()
////
//////        .next(ARobot.self)
//////        .assert(.a_foo)
//////        .pop()
////
////        .assert("test")
////        .pop()
////
////        .assert(.a_foo)
////
////        .presentC()
////        .assert(.c_qux)
////        .dismiss()
////
////        .assert(.a_foo)
////
////        .next(CRobot.self)
////        .assert(.c_qux)
//
//
//
//
//    let a = ARobot.launch()
//        .assert(.a_foo)
//        .push(BRobot.self)
//        .assert("B test")
//        .pop()
//        .assert(.a_bar)
//        .present(BRobot.self)
//        .assert("b test 2")
//        .dismiss()
//        .assert(.a_bar)
////        .replaceElements(New.self)
////        .assert(.newOne)

//    let a = ARobot
//        .launch()
//        .assert(.a_bar)
//        .replaceElements(New.self)
//        .assert(.)
}

enum New: String {
    case newOne, newTwo
}
