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
            .exact("15.16.0")
        ),
        .package(
            url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package.git",
            .exact("4.20.1")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Unity/releases/download/15.16.0/TPUnityAdapter-15.16.0.xcframework.zip",
            checksum: "a7cf964ac49c1ecbe3697fe7340371ea4e16f5c852322bc20947a112d62d1037"
        ),
    ]
)
