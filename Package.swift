// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "FirebaseCrashlyticsOnly",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "FirebaseCrashlytics",
            targets: ["FirebaseCrashlytics"]
        ),
    ],
    dependencies: [
        // Required base Google dependencies
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "9.1.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", from: "7.11.5"),
    ],
    targets: [
        .target(
            name: "FirebaseCrashlytics",
            dependencies: [
                "FirebaseCore",
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULISASwizzler", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
            ],
            path: "Crashlytics",
            exclude: [
                "Example",
                "Interop"
            ],
            publicHeadersPath: "Public",
            cSettings: [
                .headerSearchPath("**"),
            ]
        ),
        .target(
            name: "FirebaseCore",
            dependencies: [
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULHeartbeatDateStorage", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
            ],
            path: "FirebaseCore",
            publicHeadersPath: "Public",
            cSettings: [
                .headerSearchPath("**"),
            ]
        )
    ]
)
