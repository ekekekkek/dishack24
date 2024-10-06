import SwiftUI

struct MainView: View {
    var studyDuration: Int
    @Binding var appState: AppState
    @State private var remainingTime: TimeInterval
    @State private var timer: Timer? = nil
    @State private var isPaused = false

    init(studyDuration: Int, appState: Binding<AppState>) {
        self.studyDuration = studyDuration
        self._appState = appState
        self._remainingTime = State(initialValue: TimeInterval(studyDuration * 3600))
    }

    var body: some View {
        ZStack {
            Color("Color")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if remainingTime > 0 {
                    ZStack {
                        Circle()
                            .trim(from: 0, to: CGFloat(remainingTime / (TimeInterval(studyDuration) * 3600)))
                            .stroke(Color.white, lineWidth: 10)
                            .frame(width: 300, height: 300)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut, value: remainingTime)
                            .padding(.top, 170)
                        
                        Text(timeString(from: remainingTime))
                            .font(.largeTitle)
                            .foregroundColor(Color("Dark"))
                            .padding(.top, 170)
                    }

                    HStack(spacing: 30) {
                        // Pause/Resume Button
                        Button(action: {
                            if isPaused {
                                resumeTimer()
                            } else {
                                pauseTimer()
                            }
                        }) {
                            Image(systemName: isPaused ? "play.fill" : "pause.fill")
                                .font(.title)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(Color("Dark"))
                                .cornerRadius(60)
                        }

                        // Quit Button
                        QuitButton(appState: $appState)
                    }
                    .padding()
                    .padding(.top, 20)
                } else {
                    // Navigate to BreakTimeView when time is up
                    EmptyView()
                }
                
                Spacer()
            }
        }
        .onAppear {
            if studyDuration == 0 {
                appState = .breakTime
            } else {
                startTimer()
            }
        }
    }

    private func startTimer() {
        isPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer?.invalidate()
                appState = .breakTime // Navigate to BreakTimeView
            }
        }
    }

    private func pauseTimer() {
        isPaused = true
        timer?.invalidate()
    }

    private func resumeTimer() {
        isPaused = false
        startTimer()
    }

    private func timeString(from time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(studyDuration: 1, appState: .constant(.main))
    }
}
