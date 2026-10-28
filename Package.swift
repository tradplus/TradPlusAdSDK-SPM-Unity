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
            .exact("15.17.0")
        ),
        .package(
            url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package.git",
            .exact("4.21.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Unity/releases/download/15.17.0/TPUnityAdapter-15.17.0.xcframework.zip",
            checksum: "35e8c037e547c4bf8ed3805c6d41c9fffe7187eb9848f31b3bb20cab3b238276"
        ),
    ]
)
