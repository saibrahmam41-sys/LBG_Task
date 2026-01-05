//
//  MockProductRepository.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

@testable import POSApp

final class MockProductRepository: ProductRepositoryProtocol {

    func getProducts() async throws -> [Product] {
        [
            Product(id: 1, title: "Apple", price: 100, description: "", image: ""),
            Product(id: 2, title: "Banana", price: 50, description: "", image: "")
        ]
    }

    func getProduct(id: Int) async throws -> Product {
        Product(id: id, title: "Apple", price: 100, description: "", image: "")
    }
}
