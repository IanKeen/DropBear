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
        let app = XCUIApplication()
        beforeLaunch(app)
        app.launchForTesting(with: configuration)
        return .init(app: app, configuration: configuration, viewHierarchy: .init(), current: .init(source: app))
    }

    /// Launch the application for testing
    public static func launch(
        beforeLaunch: (XCUIApplication) -> Void = { _ in }
    ) -> RunningRobot<NoConfiguration, Window, Self> {
        let app = XCUIApplication()
        beforeLaunch(app)
        app.launchForTesting()
        return .init(app: app, configuration: .init(), viewHierarchy: .init(), current: .init(source: app))
    }
}
