//
//  TestConfiguration.swift
//  DropBearSupport
//
//  Created by Ian Keen on 2021-03-03.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

/// Retrieve the configuration that was defined by the UI test
///
/// - Tag: UITestConfiguration
public func UITestConfiguration<T: TestConfigurationSource>(_: T.Type = T.self) -> TestConfiguration<T>? {
    guard let folder = ProcessInfo.processInfo.environment["UITestingFolder"] else {
        print(
            """

            No UI test configuration has been provided.
            Please preload one using `XCUIApplication.launchForTesting(with:)`, `XCUIApplication.useConfiguration(_:)`
            or by launching a robot with `YourRobot.launch(using:)`

            """
        )
        return nil
    }

    return TestConfiguration(testDirectory: URL(fileURLWithPath: folder))
}

public protocol TestConfigurationSource: Codable {
    init()
}

public let configurationFile = "_configuration.json"

@dynamicMemberLookup
public struct TestConfiguration<Source: TestConfigurationSource> {
    public let testDirectory: URL

    public var source: Source

    public init() {
        func temporaryFolder() -> URL {
            let id = UUID().uuidString
            let testDirectory = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent(id)
            return testDirectory
        }

        var testDirectory = temporaryFolder()

        while FileManager.default.fileExists(atPath: testDirectory.absoluteString) {
            testDirectory = temporaryFolder()
        }

        try! FileManager.default.createDirectory(at: testDirectory, withIntermediateDirectories: true, attributes: nil)

        self.testDirectory = testDirectory
        self.source = .init()
    }

    public init?(testDirectory: URL) {
        let configuration = testDirectory.appendingPathComponent(configurationFile, isDirectory: false)
        self.source = try! JSONDecoder().decode(Source.self, from: Data(contentsOf: configuration))
        self.testDirectory = testDirectory
    }

    public subscript<T>(dynamicMember keyPath: KeyPath<Source, T>) -> T {
        return source[keyPath: keyPath]
    }
    public subscript<T>(dynamicMember keyPath: WritableKeyPath<Source, T>) -> T {
        get { source[keyPath: keyPath] }
        set { source[keyPath: keyPath] = newValue }
    }

    public func file(named name: String) -> URL {
        let url = testDirectory.appendingPathComponent(name, isDirectory: false)
        if !FileManager.default.fileExists(atPath: url.absoluteString) {
            FileManager.default.createFile(atPath: url.absoluteString, contents: nil, attributes: nil)
        }
        return url
    }
    public func cleanup() {
        try? FileManager.default.removeItem(at: testDirectory)
    }
}
