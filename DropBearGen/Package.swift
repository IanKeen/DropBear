// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "DropBearGen",
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50400.0")),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "4.0.0")
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
