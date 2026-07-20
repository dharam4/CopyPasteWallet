// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Support"),
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                .product(name: "Domain", package: "domain"),
                .product(name: "Support", package: "support"),
            ]
        ),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]
        ),
    ]
)
