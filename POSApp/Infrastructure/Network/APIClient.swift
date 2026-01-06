//
//  APIClient.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import Foundation

final class APIClient: APIClientProtocol {
    private let baseURL = "https://fakestoreapi.com"

    func fetchProducts() async throws -> [Product] {
        let url = URL(string: "\(baseURL)/products")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }

    func fetchProduct(id: Int) async throws -> Product {
        let url = URL(string: "\(baseURL)/products/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Product.self, from: data)
    }
}
