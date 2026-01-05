//
//  MockNetworkMonitor.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

@testable import POSApp
final class MockNetworkMonitor: NetworkMonitoring {

    let isConnected: Bool

       init(isConnected: Bool) {
           self.isConnected = isConnected
       }
}
