// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "HillListsBackupLibrary",
        products: [
          .library(
                  name: "HillListsBackupLibrary",
                  targets: ["HillListsBackupLibrary"]),
        ],
        dependencies: [
        ],
        targets: [
          .target(
                  name: "HillListsBackupLibrary",
                  dependencies: [],
                  path: "Sources"),
          .testTarget(
                  name: "HillListsBackupLibraryTests",
                  dependencies: ["HillListsBackupLibrary"]),
        ]
)
