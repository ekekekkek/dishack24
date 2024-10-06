import SwiftUI
import UserNotifications
import UIKit

struct AfterQuitView: View {
    @Binding var appState: AppState
    @Binding var studyDuration: Int // To restart the timer with the same duration
    @State private var showAlert = false

    var body: some View {
        VStack {
            Spacer()

            Text("Oh no...\nYou quit your study session...")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
                .padding(.top, 30)
                .padding(.bottom, 90)
                .foregroundColor(Color("Dark"))

            Button(action: {
                // Navigate to TimeView to select a new duration
                appState = .time
            }) {
                Text("Set New Session")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(Color("Dark"))
                    .cornerRadius(10)
            }
            .padding()
            .padding(.bottom, -20)

            Button(action: {
                scheduleReminderNotification()
            }) {
                Text("Remind me in 15 minutes")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(Color("Dark"))
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Notifications Disabled"),
                    message: Text("Please enable notifications in Settings to receive reminders."),
                    primaryButton: .default(Text("Settings")) {
                        // Open the app's settings
                        if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(appSettings)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }

            Spacer()
        }
        .padding()
        .background(Color("Color"))
        .edgesIgnoringSafeArea(.all)
    }

    func scheduleReminderNotification() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                content.title = "Time to Study!"
                content.body = "It's time to get back to your study session."
                content.sound = UNNotificationSound.default

                // Trigger after 15 minutes
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15 * 60, repeats: false)

                // Create the request
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // Schedule the request with the system
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error)")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    showAlert = true
                }
            }
        }
    }
}

struct AfterQuitView_Previews: PreviewProvider {
    @State static var appState = AppState.afterQuit
    @State static var studyDuration = 1

    static var previews: some View {
        AfterQuitView(appState: $appState, studyDuration: $studyDuration)
    }
}
