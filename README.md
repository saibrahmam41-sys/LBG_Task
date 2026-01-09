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
<img width="310" height="1093" alt="Screenshot 2026-01-09 at 3 30 21 PM" src="https://github.com/user-attachments/assets/99350497-83cd-4cff-a7b9-14b45228a68e" />


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

📸 Screenshots 

<img width="150" height="300" alt="IMG_2852" src="https://github.com/user-attachments/assets/c953540d-b4dd-4da8-8bb3-d9c44d7fe3b6" />


<img width="150" height="300" alt="IMG_2851" src="https://github.com/user-attachments/assets/ae071be4-630f-4578-ad0d-30dad9bfa960" />
