//
//  APIClientProtocol.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

protocol APIClientProtocol {
    func fetchProducts() async throws -> [Product]
    func fetchProduct(id: Int) async throws -> Product
}
