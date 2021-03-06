// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftProductGenerator",
    products: [
       .library(name: "SwiftProductGenerator", targets: ["SwiftProductGenerator"])
    ],
    targets: [
        .target(
            name: "SwiftProductGenerator"),
        .testTarget(
            name: "SwiftProductGeneratorTests",
            dependencies: ["SwiftProductGenerator"]),
    ]
)
