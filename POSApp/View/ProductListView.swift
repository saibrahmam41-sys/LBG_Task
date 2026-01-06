import SwiftUI

struct ProductListView: View {

    @StateObject private var viewModel: ProductListViewModel

    init() {
        let repository = ProductRepository(api: APIClient())
        let network = NetworkMonitor()

        _viewModel = StateObject(
            wrappedValue: ProductListViewModel(
                repository: repository,
                network: network
            )
        )
    }

    var body: some View {
        NavigationStack {
            List(viewModel.products) { product in
                NavigationLink {
                    ProductDetailView(
                          viewModel: ProductDetailViewModel(
                            id: product.id,
                              repository: ProductRepository(api: APIClient()),
                              network: NetworkMonitor()
                          )
                      )
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(product.title)
                            .font(.headline)

                        Text("₹ \(product.price, specifier: "%.2f")")
                            .foregroundColor(.green)
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("POS Sales")
            .task {
                await viewModel.load()
            }
        }
    }
}
