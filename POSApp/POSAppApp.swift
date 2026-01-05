//
//  POSAppApp.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import SwiftUI

@main
struct POSAppApp: App {
         @StateObject private var networkMonitor = NetworkMonitor()
    private let jailbreakDetector = JailbreakDetector()
    @State private var showJailbreakAlert = false

    var body: some Scene {
           WindowGroup {
               ProductListView()
                   .networkAlert(using: networkMonitor)
                   .alert(
                       "Security Alert",
                       isPresented: $showJailbreakAlert,
                       actions: {
                           Button("Exit", role: .destructive) {
                               exit(0)
                           }
                       },
                       message: {
                           Text("This device appears to be jailbroken. The app cannot be used.")
                       }
                   )
                   .onAppear {
                       showJailbreakAlert = jailbreakDetector.isJailbroken()
                   }
           }
       }
}
