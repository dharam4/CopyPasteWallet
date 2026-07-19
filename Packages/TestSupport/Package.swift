// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "TestSupport",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "TestSupport",
            targets: ["TestSupport"],
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Support"),
    ],
    targets: [
        .target(
            name: "TestSupport",
            dependencies: [
                .product(name: "Domain", package: "domain"),
                .product(name: "Support", package: "support"),
            ],
        ),
        .testTarget(
            name: "TestSupportTests",
            dependencies: ["TestSupport"],
        ),
    ],
)
