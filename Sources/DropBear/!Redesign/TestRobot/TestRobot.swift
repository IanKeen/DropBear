//
//  TestRobot.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-19.
//

public struct TestRobot<Configuration, Context, Current: AnyRobotType> {
    public var configuration: Configuration
    public var context: Context
    public var current: Current
}

public protocol AnyRobotType {
    associatedtype Base: Robot
    associatedtype Element: RawRepresentable where Element.RawValue == String
    
    var base: Base { get }
}

public struct _AnyRobot<Base: Robot, Element: RawRepresentable>: AnyRobotType where Element.RawValue == String {
    public var base: Base
}
