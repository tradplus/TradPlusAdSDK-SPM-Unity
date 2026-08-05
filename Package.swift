// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusUnityAdapter",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "TradPlusUnityAdapter",
            targets: ["TradPlusUnityAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.12.0")
        ),
        .package(
            url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package.git",
            .exact("4.19.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusUnityAdapter",
            dependencies: [
                .target(name: "TPUnityAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "UnityAds", package: "Unity-Ads-Swift-Package"),
            ],
            path: ".",
            sources: ["Sources/TradPlusUnityAdapter/TradPlusUnityAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPUnityAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Unity/releases/download/15.12.0/TPUnityAdapter-15.12.0.xcframework.zip",
            checksum: "5ceb3f3c0a9b8959ca17f147f0d4116cee877b45133f8852fcbda3effd6619d1"
        ),
    ]
)
