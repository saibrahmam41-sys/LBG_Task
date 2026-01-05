//
//  MockAPIClient.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//
import UIKit
@testable import POSApp

final class MockAPIClient: APIClientProtocol {

    let shouldFail: Bool
    let returnInvalidJSON: Bool

    init(shouldFail: Bool = false, returnInvalidJSON: Bool = false) {
        self.shouldFail = shouldFail
        self.returnInvalidJSON = returnInvalidJSON
    }

    func fetchProducts() async throws -> [Product] {
        if shouldFail {
            throw URLError(.notConnectedToInternet)
        }
        if returnInvalidJSON {
            throw DecodingError.dataCorrupted(
                .init(codingPath: [], debugDescription: "Invalid JSON")
            )
        }
        return [
            Product(id: 1, title: "Apple", price: 100, description: "", image: ""),
            Product(id: 2, title: "Banana", price: 50, description: "", image: "")
        ]
    }

    func fetchProduct(id: Int) async throws -> Product {
        if shouldFail {
            throw URLError(.notConnectedToInternet)
        }
        return Product(id: id, title: "Apple", price: 100, description: "", image: "")
    }
}
