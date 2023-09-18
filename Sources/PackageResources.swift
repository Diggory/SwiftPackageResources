@main
struct PackageResourcesMain {
	public private(set) var text = "Hello, World!"

	public static func main() {
		print("Hello!")
		let aStruct = SampleStruct()
		print("aStruct: \(aStruct)")
	}
}


///	A simple struct for testing
struct SampleStruct: Codable {
	var aString: String = "This is a string"
	var anInt: Int = 1234
	
	func doubleTheInt() -> Int {
		return anInt * 2
	}
	
	func capitaliseTheString() -> String {
		return aString.uppercased()
	}
}

