//
//  APIClientTests.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import XCTest

final class APIClientTests: XCTestCase {

    func test_fetchProducts_errorPath() async {
        let api = MockAPIClient(shouldFail: true)

        do {
            _ = try await api.fetchProducts()
            XCTFail("Expected error")
        } catch {
            XCTAssertTrue(true)
        }
    }

    func test_fetchProducts_decodingFailure() async {
        let api = MockAPIClient(returnInvalidJSON: true)

        do {
            _ = try await api.fetchProducts()
            XCTFail("Expected decoding error")
        } catch {
            XCTAssertTrue(true)
        }
    }
}
