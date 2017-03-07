import PackageDescription

let package = Package(
    name: "Query",
	dependencies: [
		.Package(url: "https://github.com/naithar/Wrap.git", majorVersion: 0, minor: 1)
	]
)
