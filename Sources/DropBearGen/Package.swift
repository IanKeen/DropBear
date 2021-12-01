// swift-tools-version:5.1

import Foundation
import PackageDescription

let package = Package(
    name: "DropBearGen",
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50500.0")),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "5.2.7")
    ],
    targets: [
        .target(
            name: "DropBearGen",
            dependencies: ["SwiftSyntax", "Kanna"]
        ),
        .testTarget(
            name: "DropBearGenTests",
            dependencies: ["DropBearGen"]),
    ]
)

hookInternalSwiftSyntaxParser()
isDebuggingMain(false)

/// When debuging from Xcode (via command + R) we need to do the dylib dance
func isDebuggingMain(_ isDebug: Bool) {
    if isDebug {
        package
            .targets
            .filter { $0.name == "DropBearGen" }
            .first?
            .installSwiftSyntaxParser()
    }
}

func hookInternalSwiftSyntaxParser() {
    let isFromTerminal = ProcessInfo.processInfo.environment.values.contains("/usr/bin/swift")
    if !isFromTerminal {
        package
            .targets
            .filter(\.isTest)
            .forEach { $0.installSwiftSyntaxParser() }
    }
}

extension PackageDescription.Target {
    func installSwiftSyntaxParser() {
        linkerSettings = [linkerSetting]
    }

    private var linkerSetting: LinkerSetting {
        guard let xcodeFolder = Executable("/usr/bin/xcode-select")("-p") else {
            fatalError("Could not run `xcode-select -p`")
        }

        let toolchainFolder = "\(xcodeFolder.trimmed)/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx"

        return .unsafeFlags(["-rpath", toolchainFolder])
    }
}

extension String {
    var trimmed: String { trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) }
}

private struct Executable {
    private let url: URL

    init(_ filePath: String) {
        url = URL(fileURLWithPath: filePath)
    }

    func callAsFunction(_ arguments: String...) -> String? {
        let process = Process()
        process.executableURL = url
        process.arguments = arguments

        let stdout = Pipe()
        process.standardOutput = stdout

        process.launch()
        process.waitUntilExit()

        return stdout.readStringToEndOfFile()
    }
}

extension Pipe {
    func readStringToEndOfFile() -> String? {
        let data: Data
        if #available(OSX 10.15.4, *) {
            data = (try? fileHandleForReading.readToEnd()) ?? Data()
        } else {
            data = fileHandleForReading.readDataToEndOfFile()
        }

        return String(data: data, encoding: .utf8)
    }
}
