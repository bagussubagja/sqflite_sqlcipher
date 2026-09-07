// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "sqflite_sqlcipher",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "sqflite-sqlcipher", targets: ["sqflite_sqlcipher"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://github.com/ccgus/fmdb", from: "2.7.12"),
        .package(url: "https://github.com/sqlcipher/SQLCipher.swift.git", from: "4.10.0")
    ],
    targets: [
        .target(
            name: "sqflite_sqlcipher",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "FMDB", package: "fmdb"),
                .product(name: "SQLCipher", package: "SQLCipher.swift")
            ],
            path: "Sources/sqflite_sqlcipher",
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: "include/sqflite_sqlcipher",
            cSettings: [
                .headerSearchPath("include/sqflite_sqlcipher"),
                .define("SQLITE_HAS_CODEC", to: "1")
            ],
            linkerSettings: [
                .linkedFramework("Security")
            ]
        )
    ]
)
