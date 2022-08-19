//
//  File.swift
//  
//
//  Created by Ian Keen on 2022-08-18.
//

import Foundation

/*
public struct Root { }

struct TestRobot<Previous, Current: Robot> {
    var previous: Previous
    var current: Current
}


extension TestRobot {
    typealias NextRobot<Next: Robot> = TestRobot<Current, Next>
    
    func next<Next: Robot>(_: Next.Type = Next.self) -> NextRobot<Next> {
        .init(previous: current, current: .init(source: current.source))
    }
}
extension TestRobot {
    @discardableResult
    func assert(_ value: Current.Element) -> Self {
        return self
    }
}

extension Robot {
    static func launch() -> TestRobot<Root, Self> {
        return .init(previous: .init(), current: .init(source: XCUIApplication()))
    }
}
*/
