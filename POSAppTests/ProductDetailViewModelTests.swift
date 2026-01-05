//
//  ProductDetailViewModelTests.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import XCTest
@testable import POSApp

@MainActor
final class ProductDetailViewModelTests: XCTestCase {

    func test_loadProduct_success() async {
        let repo = MockProductRepository()
        let network = MockNetworkMonitor(isConnected: true)

        let vm = ProductDetailViewModel(
            id: 1,
            repository: repo,
            network: network
        )

        await vm.load()

        XCTAssertEqual(vm.product?.title, "Apple")
    }

    func test_loadProduct_noInternet() async {
        let repo = MockProductRepository()
        let network = MockNetworkMonitor(isConnected: false)

        let vm = ProductDetailViewModel(
            id: 1,
            repository: repo,
            network: network
        )

        await vm.load()

        XCTAssertEqual(vm.error, "No Internet")
    }
}
