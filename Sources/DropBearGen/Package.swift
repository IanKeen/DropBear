// swift-tools-version:5.5

import Foundation
import PackageDescription

let package = Package(
    name: "DropBearGen",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "DropBearGen", targets: ["DropBearGen"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50600.1")),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "5.2.7")
    ],
    targets: [
        .executableTarget(
            name: "DropBearGen",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxParser", package: "swift-syntax"),
                "lib_InternalSwiftSyntaxParser",
                "Kanna"
            ],
            // Pass `-dead_strip_dylibs` to ignore the dynamic version of `lib_InternalSwiftSyntaxParser`
            // that ships with SwiftSyntax because we want the static version from
            // `StaticInternalSwiftSyntaxParser`.
            linkerSettings: [
                .unsafeFlags(["-Xlinker", "-dead_strip_dylibs"])
            ]
        ),
        .testTarget(
            name: "DropBearGenTests",
            dependencies: ["DropBearGen"]
        ),
        .binaryTarget(
            name: "lib_InternalSwiftSyntaxParser",
            url: "https://github.com/keith/StaticInternalSwiftSyntaxParser/releases/download/5.6/lib_InternalSwiftSyntaxParser.xcframework.zip",
            checksum: "88d748f76ec45880a8250438bd68e5d6ba716c8042f520998a438db87083ae9d"
        )
    ]
)
