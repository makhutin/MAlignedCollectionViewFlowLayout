// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "MAlignedCollectionViewFlowLayout",
    products: [
        .library(name: "MAlignedCollectionViewFlowLayout", targets: ["MAlignedCollectionViewFlowLayout"])
    ],
    targets: [
        .target(
            name: "MAlignedCollectionViewFlowLayout",
            path: "MAlignedCollectionViewFlowLayout"
        )
    ]
)
