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
extension URLSession {
    static var failing: URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [FailingURLProtocol.self]
        return URLSession(configuration: config)
    }
}

final class FailingURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }
    override func startLoading() {
        client?.urlProtocol(self, didFailWithError: URLError(.notConnectedToInternet))
    }
    override func stopLoading() {}
}
