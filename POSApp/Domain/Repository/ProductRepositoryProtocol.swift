//
//  ProductRepositoryProtocol.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

protocol ProductRepositoryProtocol {
    func getProducts() async throws -> [Product]
    func getProduct(id: Int) async throws -> Product
}
