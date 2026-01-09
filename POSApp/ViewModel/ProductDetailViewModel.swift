//
//  ProductDetailViewModel.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {

    @Published var product: Product?
    @Published var error: String?

    private let repository: ProductRepositoryProtocol
    private let network: NetworkMonitoring
    private let id: Int

    init(
        id: Int,
        repository: ProductRepositoryProtocol,
        network: NetworkMonitoring
    ) {
        self.id = id
        self.repository = repository
        self.network = network
    }
    @MainActor
    func load() async {
        guard network.isConnected else {
            error = ErrorMessages.noInternet
            return
        }

        product = try? await repository.getProduct(id: id)
    }
}
