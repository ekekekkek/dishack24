import SwiftUI
import UserNotifications

@main
struct DivHack_PrototypeApp: App {
    init() {
        // Request notification authorization when the app launches
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            }
            // You can handle the 'granted' boolean here if needed
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
