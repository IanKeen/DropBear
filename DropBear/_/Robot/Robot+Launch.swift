//
//  Robot+Launch.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DropBearSupport
import XCTest

extension Robot where Self: Launchable {
    /// Launch the application for testing passing the provided configuration
    public static func launch<T: TestConfigurationSource>(
        using configuration: TestConfiguration<T>,
        beforeLaunch: (XCUIApplication) -> Void = { _ in }
    ) -> RunningRobot<T, Window, Self> {
        return launch(using: configuration, in: .unchanged, beforeLaunch: beforeLaunch)
    }

    /// Launch the application for testing
    public static func launch(
        beforeLaunch: (XCUIApplication) -> Void = { _ in }
    ) -> RunningRobot<NoConfiguration, Window, Self> {
        return launch(using: .init(), beforeLaunch: beforeLaunch)
    }

    /// Launch the application for testing starting in the provided hierarchy
    public static func launch<ViewHierarchy>(
        in hierarchy: RunningRobot<NoConfiguration, Window, Self>.NextRobotAction<ViewHierarchy, Self>,
        beforeLaunch: (XCUIApplication) -> Void = { _ in }
    ) -> RunningRobot<NoConfiguration, ViewHierarchy, Self> {
        return launch(using: .init(), in: hierarchy, beforeLaunch: beforeLaunch)
    }

    /// Launch the application for testing in the provided hierarchy passing the provided configuration
    public static func launch<T: TestConfigurationSource, ViewHierarchy>(
        using configuration: TestConfiguration<T>,
        in hierarchy: RunningRobot<T, Window, Self>.NextRobotAction<ViewHierarchy, Self>,
        beforeLaunch: (XCUIApplication) -> Void = { _ in }
    ) -> RunningRobot<T, ViewHierarchy, Self> {
        let app = XCUIApplication()
        beforeLaunch(app)
        app.launchForTesting(with: configuration)

        let source = RunningRobot.init(app: app, configuration: configuration, viewHierarchy: Window(), current: Self(source: app))
        return source.apply(hierarchy)
    }
}
