// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlamCocoaSpellBook",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "SlamCocoaSpellBook",
            targets: ["SlamCocoaSpellBook"]),
    ],
    dependencies: [
        .package(url: "https://github.com/magesteve/CocoaSpellBook.git", from: "1.1.0"),
        .package(url: "https://github.com/magesteve/SwiftSpellBook.git", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "SlamCocoaSpellBook",
            dependencies: ["SwiftSpellBook","CocoaSpellBook"]),
        .testTarget(
            name: "SlamCocoaSpellBookTests",
            dependencies: ["SwiftSpellBook","CocoaSpellBook","SlamCocoaSpellBook"]),
    ]
)
