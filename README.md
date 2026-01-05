A demo application built using SwiftUI, MVVM, and Clean Architecture, consuming real product data from FakeStore API.
This project focuses on scalability, testability, and production-ready practices


📱 Features
- Product List (POS Sales View)
- Product Detail View
- Real API Integration (https://fakestoreapi.com)
- Network Connectivity Monitoring
- Jailbreak Detection
- Network Offline Alert (SwiftUI Modifier)
- Unit Tests with 80%+ Code Coverage
- SwiftLint via Swift Package Manager
- Clean Architecture + MVVM

🏗 Architecture
- This project follows Clean Architecture principles with MVVM for presentation.
<img width="312" height="1031" alt="Screenshot 2026-01-06 at 12 49 27 AM" src="https://github.com/user-attachments/assets/9f8548c4-d36d-437c-9187-420811d2bf5f" />

🌐 Network Handling
- NetworkMonitor detects real-time connectivity
- Offline state shows a SwiftUI alert using a reusable ViewModifier
- ViewModels block API calls when offline

🔐 Jailbreak Detection
  - Implemented basic jailbreak detection to identify compromised devices.
    Covered scenarios:
    - Suspicious file paths
    - Writable system directories
    - Cydia presence
   
SwiftLint
- SwiftLint is integrated via Swift Package Manager Plugin.
