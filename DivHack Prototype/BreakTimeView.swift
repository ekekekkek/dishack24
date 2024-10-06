import SwiftUI

struct BreakTimeView: View {
    @Binding var appState: AppState
    @State private var remainingTime: TimeInterval = 300 // 5 minutes in seconds
    @State private var timer: Timer? = nil

    var body: some View {
        ZStack {
            Color("Color")
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                Text("Break Time!")
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Dark"))
                    .font(.system(size: 30))
                    .padding(.top, 0)

                // Circular Timer
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0), lineWidth: 10)
                        .frame(width: 250, height: 250)

                    Circle()
                        .trim(from: 0, to: CGFloat(remainingTime) / 300)
                        .stroke(Color.white, lineWidth: 10)
                        .frame(width: 250, height: 250)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 0.5), value: remainingTime)

                    Text(timeString(from: remainingTime))
                        .font(.system(size: 48))
                        .foregroundColor(Color("Fonts"))
                }
                .padding()
                .padding(.bottom, 60)
                .padding(.top, 20)

                // Icons and Encouraging Phrase
                VStack(spacing: 10) {
                    HStack(spacing: 20) {
                        Image(systemName: "figure.cooldown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.gray.opacity(0.2))

                        Image(systemName: "figure.cross.training")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("Dark"))

                        Image(systemName: "figure.strengthtraining.functional")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.gray.opacity(0.2))
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                    .padding(.top, -20)
                    
                    Text("20x Squats")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Dark"))
                        .font(.system(size: 20))

                    Text("You're doing great! Get your blood flowing and keep yourself refreshed.\n\nGet extra stars by completing your mission.")
                        .font(.headline)
                        .foregroundColor(Color("Fonts"))
                        .multilineTextAlignment(.center)
                        .padding()
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    Button(action: {
                                            // No action needed
                                        }) {
                                            Text("Mission Complete!")
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(Color("Dark"))
                                                .cornerRadius(10)
                                        }
                                        .padding(.horizontal)
                                        .padding(.top, 20)
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        // Add the onAppear modifier to start the timer when the view appears
        .onAppear {
            startTimer()
        }
        // Invalidate the timer when the view disappears to prevent memory leaks
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startTimer() {
        timer?.invalidate() // Ensure any existing timer is invalidated
        remainingTime = 300 // Reset the timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer?.invalidate()
                timerEnded()
            }
        }
    }

    private func timerEnded() {
        // Navigate back to TimeView
        appState = .time
    }

    private func timeString(from time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct BreakTimeView_Previews: PreviewProvider {
    @State static var appState = AppState.breakTime

    static var previews: some View {
        BreakTimeView(appState: $appState)
    }
}
