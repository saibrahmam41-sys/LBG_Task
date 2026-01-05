//
//  JailbreakDetectorTests.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//
import XCTest
@testable import POSApp

final class JailbreakDetectorTests: XCTestCase {

    func test_notJailbroken_returnsFalse() {
        let detector = JailbreakDetector()
        XCTAssertFalse(detector.isJailbroken())
    }

    func test_mockJailbroken_returnsTrue() {
        let detector = MockJailbreakDetector(jailbroken: true)
        XCTAssertTrue(detector.isJailbroken())
    }
}
