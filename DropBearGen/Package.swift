// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "DropBearGen",
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50200.0")),
        .package(name: "Kanna", url: "https://github.com/tid-kijyun/Kanna.git", from: "4.0.0")
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
