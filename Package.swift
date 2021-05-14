// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "DropBear",
    platforms: [.iOS(.v10), .macOS(.v10_15)],
    products: [
        .library(name: "DropBear", targets: ["DropBear"]),
        .library(name: "DropBearSupport", targets: ["DropBearSupport"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50400.0")),
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
