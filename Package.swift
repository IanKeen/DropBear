// swift-tools-version:5.3
import Foundation
import PackageDescription

let package = Package(
    name: "DropBear",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "DropBear", targets: ["DropBear"]),
        .library(name: "DropBearSupport", targets: ["DropBearSupport"]),
    ],
    dependencies: [
    ],
    targets: [
        // Library
        .target(
            name: "DropBear",
            exclude: ["Info.plist", "DropBear.h"],
            linkerSettings: [.linkedFramework("XCTest")]
        ),
        .testTarget(
            name: "DropBearTests",
            dependencies: ["DropBear"],
            exclude: ["Info.plist"]
        ),

        // App Support
        .target(
            name: "DropBearSupport",
            exclude: ["Info.plist", "DropBearSupport.h"]
        ),
        .testTarget(
            name: "DropBearSupportTests",
            dependencies: ["DropBearSupport"],
            exclude: ["Info.plist"]
        ),
    ]
)
