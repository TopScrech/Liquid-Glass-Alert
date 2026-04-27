// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Liquid-Glass-Alert",
    platforms: [
        .iOS(.v26),
        .visionOS(.v26)
    ],
	products: [
		.library(
			name: "LGAlert",
			targets: ["LGAlert"]
		)
	],
	targets: [
		.target(name: "LGAlert")
	],
    swiftLanguageModes: [.v6]
)
