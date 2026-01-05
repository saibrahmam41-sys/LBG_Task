//
//  ProductRepository.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import Foundation

final class ProductRepository: ProductRepositoryProtocol {
    private let api: APIClientProtocol

    init(api: APIClientProtocol) {
        self.api = api
    }

    func getProducts() async throws -> [Product] {
        try await api.fetchProducts()
    }

    func getProduct(id: Int) async throws -> Product {
        try await api.fetchProduct(id: id)
    }
}
