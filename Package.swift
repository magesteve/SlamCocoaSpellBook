// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlamCocoaSpellBook",
    products: [
        .library(
            name: "SlamCocoaSpellBook",
            targets: ["SlamCocoaSpellBook"]),
    ],
    dependencies: [
        .package(url: "https://github.com/magesteve/CocoaSpellBook.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SlamCocoaSpellBook",
            dependencies: ["CocoaSpellBook"]),
        .testTarget(
            name: "SlamCocoaSpellBookTests",
            dependencies: ["CocoaSpellBook","SlamCocoaSpellBook"]),
    ]
)
