import PackageDescription

let package = Package(
    name: "SidekiqPushClient",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura-redis.git", majorVersion: 1),
        .Package(url: "https://github.com/JohnSundell/Wrap.git", majorVersion: 2),
    ]
)
