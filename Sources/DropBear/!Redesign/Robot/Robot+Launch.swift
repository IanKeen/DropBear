//
//  Robot+Launch.swift
//  DropBear
//
//  Created by Ian Keen on 2022-08-18.
//

import XCTest

public struct NoConfiguration: Equatable { }

extension Robot {
    public static func launch() -> TestRobot<NoConfiguration, NoContext, _AnyRobot<Self, ElementSet1<Self.Element>>> {
        return launch(configuration: NoConfiguration())
    }
    
    public static func launch<Configuration>(configuration: Configuration) -> TestRobot<Configuration, NoContext, _AnyRobot<Self, ElementSet1<Self.Element>>> {
        return .init(
            configuration: configuration,
            context: .init(),
            current: .init(base: .init(source: XCUIApplication()))
        )
    }
}
