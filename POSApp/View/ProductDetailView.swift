//
//  ProductDetailView.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import SwiftUI

struct ProductDetailView: View {

    @StateObject private var viewModel: ProductDetailViewModel

    init(productId: Int) {
        let repository = ProductRepository(api: APIClient())
        let network = NetworkMonitor()

        _viewModel = StateObject(
            wrappedValue: ProductDetailViewModel(
                id: productId,
                repository: repository,
                network: network
            )
        )
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {

                if let product = viewModel.product {

                    AsyncImage(url: URL(string: product.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                    .scaledToFit()

                    Text(product.title)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)

                    Text("₹ \(product.price, specifier: "%.2f")")
                        .font(.title3)
                        .foregroundColor(.green)

                    Text(product.description)
                        .font(.body)
                        .padding()
                }

                if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
        .navigationTitle("Product Detail")
        .task {
            await viewModel.load()
        }
    }
}
