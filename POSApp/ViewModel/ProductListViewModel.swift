//
//  ProductListViewModel.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import Foundation

@MainActor
final class ProductListViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var error: String?

    private let repository: ProductRepositoryProtocol
    private let network: NetworkMonitoring

    init(
        repository: ProductRepositoryProtocol,
        network: NetworkMonitoring
    ) {
        self.repository = repository
        self.network = network
    }

    func load() async {
        guard network.isConnected else {
            error = "No Internet"
            return
        }

        do {
            products = try await repository.getProducts()
        } catch {
            self.error = error.localizedDescription
        }
    }
}
