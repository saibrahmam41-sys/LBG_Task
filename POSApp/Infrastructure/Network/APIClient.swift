//
//  APIClient.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import Foundation

final class APIClient: APIClientProtocol {
   
    func fetchProducts() async throws -> [Product] {
        let url = URL(string: APIConstants.baseURL + APIConstants.products)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }

    func fetchProduct(id: Int) async throws -> Product {
        let url = URL(string: APIConstants.baseURL + APIConstants.products + "/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Product.self, from: data)
    }
}
