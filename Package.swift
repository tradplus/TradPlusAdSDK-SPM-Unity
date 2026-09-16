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
            .exact("15.15.0")
        ),
        .package(
            url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package.git",
            .exact("4.20.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Unity/releases/download/15.15.0/TPUnityAdapter-15.15.0.xcframework.zip",
            checksum: "119f2522538b673109535e80edd3fb59ef6e1a2024b0fe09315602750b1cb9cd"
        ),
    ]
)
