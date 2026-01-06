//
//  ProductDetailView.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import SwiftUI

struct ProductDetailView: View {

    @StateObject private var viewModel: ProductDetailViewModel

    init(viewModel: ProductDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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

                    Text("₹ \(product.price, specifier: "%.2f")")
                        .foregroundColor(.green)

                    Text(product.description)
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
