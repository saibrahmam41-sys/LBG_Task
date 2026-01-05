//
//  NetworkMonitor.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import Network
import SwiftUI

class NetworkMonitor: NetworkMonitoring,ObservableObject {

    @Published private(set) var isConnected: Bool = true

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            Task { @MainActor in
                self?.isConnected = (path.status == .satisfied)
            }
        }
        monitor.start(queue: queue)
    }
}
