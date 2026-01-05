//
//  ProductListViewModelTests.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import XCTest
@testable import POSApp

@MainActor
final class ProductListViewModelTests: XCTestCase {

    func test_loadProducts_success() async {
        let repo = MockProductRepository()
        let network = MockNetworkMonitor(isConnected: true)

        let vm = ProductListViewModel(
            repository: repo,
            network: network
        )

        await vm.load()

        XCTAssertEqual(vm.products.count, 2)
    }

    func test_loadProducts_noInternet() async {
        let repo = MockProductRepository()
        let network = MockNetworkMonitor(isConnected: false)

        let vm = ProductListViewModel(
            repository: repo,
            network: network
        )

        await vm.load()

        XCTAssertEqual(vm.error, "No Internet")
    }
}
