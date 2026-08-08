// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Hello",
    platforms: [
        .iOS(.v18),
        .macOS(.v14),
    ],
    products: [
        // An xtool project should contain exactly one library product,
        // representing the main app.
        .library(
            name: "Hello",
            targets: ["Hello"]
        ),
    ],

    dependencies: [
        .package(url: "https://github.com/pointfreeco/sqlite-data.git", from: "1.9.0")
    ],

    targets: [
        .target(
            name: "Hello",
            dependencies: [
                .product(name: "SQLiteData", package: "sqlite-data")
            ],
        ),
    ]
)
