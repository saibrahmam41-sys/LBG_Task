//
//  NetworkAlertModifier.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import SwiftUI

struct NetworkAlertModifier: ViewModifier {

    @ObservedObject var networkMonitor: NetworkMonitor

    func body(content: Content) -> some View {
        content
            .alert(
                "No Internet",
                isPresented: .constant(!networkMonitor.isConnected),
                actions: {
                    Button("OK", role: .cancel) {}
                },
                message: {
                    Text("Please check your internet connection.")
                }
            )
    }
}

extension View {
    func networkAlert(using monitor: NetworkMonitor) -> some View {
        self.modifier(NetworkAlertModifier(networkMonitor: monitor))
    }
}
