// swift-tools-version:5.3

import Foundation
import PackageDescription

let package = Package(
    name: "DropBear",
    platforms: [.iOS(.v10), .macOS(.v10_15)],
    products: [
        .library(name: "DropBear", targets: ["DropBear"]),
        .library(name: "DropBearSupport", targets: ["DropBearSupport"]),
        .executable(name: "DropBearGen", targets: ["DropBearGen"])
    ],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50400.0")),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "4.0.0")
    ],
    targets: [
        // Library
        .target(name: "DropBear"),

        // App Support
        .target(name: "DropBearSupport"),
        .testTarget(name: "DropBearSupportTests", dependencies: ["DropBearSupport"]),

        // Generator
        .target(name: "DropBearGen", dependencies: ["SwiftSyntax", "Kanna"]),
        .testTarget(name: "DropBearGenTests", dependencies: ["DropBearGen"]),
    ]
)

linkInternalSwiftSyntaxParser()
isDebuggingMain(false)

func isDebuggingMain(_ isDebug: Bool) {
    if isDebug {
        package
            .targets
            .filter { $0.name == "muter" }
            .first?
            .installSwiftSyntaxParser()
    }
}

func linkInternalSwiftSyntaxParser() {
    let runningFromTerminal = ProcessInfo.processInfo.environment.values.contains("/usr/bin/swift")
    guard !runningFromTerminal else { return }

    package.targets
        .filter(\.isTest)
        .forEach { $0.installSwiftSyntaxParser() }
}

extension PackageDescription.Target {
    func installSwiftSyntaxParser() {
        linkerSettings = [linkerSetting]
    }
    private var linkerSetting: LinkerSetting {
        guard let path = Executable(filePath: "/usr/bin/xcode-select")("-p") else {
            fatalError("Missing Xcode command line tools.")
        }

        let toolchain = "\(path.trimmed)/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx"
        return .unsafeFlags(["-rpath", toolchain])
    }
}

extension String {
    var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
}

private struct Executable {
    private let url: URL
    init(filePath: String) {
        self.url = .init(fileURLWithPath: filePath)
    }
    func callAsFunction(_ args: String...) -> String? {
        let process = Process()
        process.executableURL = url
        process.arguments = args

        let stdout = Pipe()
        process.standardOutput = stdout

        process.launch()
        process.waitUntilExit()

        return stdout.readToEOF()
    }
}

extension Pipe {
    func readToEOF() -> String? {
        let data: Data
        if #available(OSX 10.15.4, *) {
            data = (try? fileHandleForReading.readToEnd()) ?? .init()
        } else {
            data = fileHandleForReading.readDataToEndOfFile()
        }

        return String(data: data, encoding: .utf8)
    }
}
