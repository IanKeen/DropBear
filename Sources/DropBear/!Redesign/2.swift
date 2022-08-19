//
//  File.swift
//  
//
//  Created by Ian Keen on 2022-08-18.
//

import Foundation
/*
 public struct Root { }

 protocol TestRobot<Current> {
     associatedtype Configuration
     associatedtype Previous
     associatedtype Current: Robot
     
     var configuration: Configuration { get }
     var previous: Previous { get }
     var current: Current { get }
     
     init(configuration: Configuration, previous: Previous, current: Current)
 }

 private struct AnyTestRobot<Configuration, Previous, Current: Robot>: TestRobot, NextRobot {
     var configuration: Configuration
     var previous: Previous
     var current: Current
 }

 extension TestRobot {
     func next<Next: Robot>(_: Next.Type = Next.self) -> some NextRobot<Self, Next> {
         AnyTestRobot(configuration: configuration, previous: self, current: .init(source: current.source))
     }
 }


 protocol NextRobot<Previous, Current>: TestRobot { }
 extension NextRobot {
     func previous() -> Previous { previous }
 }
 */
