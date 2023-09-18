//
//  SomeTests.swift
//  
//
//  Created by Diggory Laycock on 18/09/2023.
//

import XCTest
import Foundation
@testable import PackageResources

final class PackageResourcesTests: XCTestCase {
	
	override class func setUp() {
		// This is the setUp() class method.
		// XCTest calls it before calling the first test method.
		// Set up any overall initial state here.
		print("Setting-up PackageResourcesTests")
	}
	
	override class func tearDown() {
		// This is the tearDown() class method.
		// XCTest calls it after the last test method completes.
		// Perform any overall cleanup here.
		print("Tearing-down PackageResourcesTests")
	}
	
	func testExample() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.
		XCTAssertEqual(PackageResourcesMain().text, "Hello, World!")
	}
}



final class SampleStructTests: XCTestCase {
	let sampleStruct = SampleStruct()
	var loadedStructFromTestData: SampleStruct = SampleStruct()
	
	class func loadSampleStructFromFilesystem(fileName: String, type: String) -> SampleStruct? {
		guard let bundleFileURL = Bundle.module.url(forResource: fileName, withExtension: type) else { return nil }
		do {
			if let importedJsonData = try String(contentsOf: bundleFileURL).data(using: .utf8) {
				let loadedStruct = try JSONDecoder().decode(SampleStruct.self, from: importedJsonData)
				return loadedStruct
			} else {
				print("ERROR: could not convert string to JSON at: \(bundleFileURL)")
				return nil
			}
		} catch {
			print("ERROR: Could not load config from JSON - \(bundleFileURL) - \(error)")
			return nil
		}
	}

	override class func setUp() {
	}
	
	override class func tearDown() {
	}
	
	func testDoubleInt() throws {
		XCTAssertEqual(sampleStruct.doubleTheInt(), 2468)
	}

	func testCapitaliseString() throws {
		XCTAssertEqual(sampleStruct.capitaliseTheString(), "THIS IS A STRING")
	}
	
	func testLoadingStruct() throws {
		let testFileName = "TestData/TestSampleStruct"
		if let loadedSampleStruct = SampleStructTests.loadSampleStructFromFilesystem(fileName: testFileName, type: "json") {
			XCTAssertEqual(loadedSampleStruct.doubleTheInt(), 19998)
		} else {
			XCTAssert(false, "Could not load test SampleStruct (\(testFileName)) from test files...")
		}
	}

}
