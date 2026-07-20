// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DataLayer",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "DataLayer",
            targets: ["DataLayer"],
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Support"),
    ],
    targets: [
        .target(
            name: "DataLayer",
            dependencies: [
                .product(name: "Domain", package: "domain"),
                .product(name: "Support", package: "support"),
            ],
        ),
        .testTarget(
            name: "DataLayerTests",
            dependencies: ["DataLayer"],
        ),
    ],
)
