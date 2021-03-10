//
//  DropBearSupportTests.swift
//  DropBearSupportTests
//
//  Created by Ian Keen on 2019-05-02.
//  Copyright © 2019 Timberlane Labs. All rights reserved.
//

import XCTest
import DropBearSupport

private typealias TestConfig = TestConfiguration<MyAppsTestConfig>

private struct MyAppsTestConfig: TestConfigurationSource {
    var name: String = "default"
    var version = 1
    var testFile: URL?
}

extension TestConfiguration where Source == MyAppsTestConfig {
    mutating func setupTestFile() {
        self.testFile = file(named: "test.json")
    }
}

class DropBearSupportTests: XCTestCase {
    func testConfig() throws {
        var config = TestConfig()
        config.version = 2

        let json = try config.dictionary()
        XCTAssertNotNil(json["testId"])
        XCTAssertNotNil(json["testDirectory"])
        XCTAssertEqual(json[path: ["source", "name"]], "default")
        XCTAssertEqual(json[path: ["source", "version"]], 2)
        XCTAssertNil(json["testFile"])
    }

    func testConfigFile() throws {
        var config = TestConfig()
        config.setupTestFile()

        let json = try config.dictionary()
        XCTAssertNotNil(json["testId"])
        XCTAssertNotNil(json["testDirectory"])
        XCTAssertEqual(json[path: ["source", "name"]], "default")
        XCTAssertEqual(json[path: ["source", "version"]], 1)

        let testFile: String = try XCTUnwrap(json[path: ["source", "testFile"]])
        XCTAssertTrue(testFile.hasSuffix("test.json"))
    }
}
