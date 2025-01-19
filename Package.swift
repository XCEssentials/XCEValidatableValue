// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "XCEValidatableValue",
    products: [
        .library(
            name: "XCEValidatableValue",
            targets: ["XCEValidatableValue"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/XCEssentials/XCERequirement", .upToNextMajor(from: "2.6.0"))
    ],
    targets: [
        .target(
            name: "XCEValidatableValue",
            dependencies: [
                "XCERequirement"
            ],
            path: "Sources/Core"
        ),
        .testTarget(
            name: "XCEValidatableValueAllTests",
            dependencies: [
                "XCEValidatableValue",
                "XCERequirement"
            ],
            path: "Tests/AllTests"
        ),
    ]
)
