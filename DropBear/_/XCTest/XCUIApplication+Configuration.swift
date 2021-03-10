//
//  XCUIApplication+Configuration.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DropBearSupport
import XCTest

/// - Tag: DropBear.Launching
extension XCUIApplication {
    /// Launch the test ensuring the `UITesting` flag is set so the application can know it is being UI tested
    ///
    /// Applications can use [isUITesting](x-source-tag://isUITesting) to know if they are being UI tested
    public func launchForTesting() {
        launchEnvironment["UITesting"] = "true"
        launch()
    }

    /// Launch the test ensuring the `UITesting` flag is set so the application can know it is being UI tested
    /// and provide `configuration` to allow
    ///
    /// - Parameter configuration: The configuration that will be made available to the application under test
    public func launchForTesting<T: TestConfigurationSource>(with configuration: TestConfiguration<T>) {
        useConfiguration(configuration)
        launchForTesting()
    }

    /// Define the `configuration` that will be made available to the application being UI tested
    ///
    /// The configuration can be obtained by the application using [UITestConfiguration](x-source-tag://UITestConfiguration)
    public func useConfiguration<T: TestConfigurationSource>(_ configuration: TestConfiguration<T>) {
        let testConfiguration = configuration.testDirectory.appendingPathComponent("_configuration.json", isDirectory: false)
        try! JSONEncoder().encode(configuration).write(to: testConfiguration, options: .atomic)
        launchEnvironment["UITestingFolder"] = testConfiguration.absoluteString
    }
}
