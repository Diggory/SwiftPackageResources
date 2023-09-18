// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "PackageResources",
	targets: [
		.executableTarget(
			name: "PackageResources",
			path: "Sources"),
		.testTarget(
			name: "PackageResourcesTests",
			dependencies: ["PackageResources"],
			resources: [
				.copy("TestData")]
		)
	]
)
