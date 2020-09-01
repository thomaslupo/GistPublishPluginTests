// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "GistPublishPluginTests",
    products: [
        .executable(
            name: "GistPublishPluginTests",
            targets: ["GistPublishPluginTests"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0"),
        .package(url: "https://github.com/thomaslupo/GistPublishPlugin", from: "0.1.0"),
        .package(url: "https://github.com/JohnSundell/Splash", from: "0.14.0")
    ],
    targets: [
        .target(
            name: "GistPublishPluginTests",
            dependencies: ["Publish", "GistPublishPlugin","Splash"]
        )
    ]
)
