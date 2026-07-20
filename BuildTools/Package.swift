// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "BuildTools",
    platforms: [
        .macOS(.v14),
    ],
    dependencies: [
        .package(
            url: "https://github.com/realm/SwiftLint",
            exact: "0.63.2",
        ),
        .package(
            url: "https://github.com/nicklockwood/SwiftFormat",
            exact: "0.61.1",
        ),
    ],
    targets: [
        .target(
            name: "BuildTools",
            path: ".",
            exclude: ["Package.resolved", "README.md"],
        ),
    ],
)
