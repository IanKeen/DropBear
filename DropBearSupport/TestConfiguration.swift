//
//  TestConfiguration.swift
//  DropBearSupport
//
//  Created by Ian Keen on 2021-03-03.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

public protocol TestConfigurationSource: Codable {
    init()
}

@dynamicMemberLookup
public struct TestConfiguration<Source: TestConfigurationSource>: Codable {
    public let testId: String
    public let testDirectory: URL

    public var source: Source

    public init() {
        func pair() -> (String, URL) {
            let id = UUID().uuidString
            let testDirectory = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent(id)
            return (id, testDirectory)
        }

        var (id, testDirectory) = pair()

        while FileManager.default.fileExists(atPath: testDirectory.absoluteString) {
            (id, testDirectory) = pair()
        }

        try! FileManager.default.createDirectory(at: testDirectory, withIntermediateDirectories: true, attributes: nil)

        self.testId = id
        self.testDirectory = testDirectory
        self.source = .init()
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
