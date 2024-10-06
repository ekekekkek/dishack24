import SwiftUI

enum AppState {
    case login
    case setup
    case time
    case main
    case afterQuit
    case breakTime
}

struct ContentView: View {
    @State private var appState: AppState = .login
    @State private var studyDuration: Int = 1

    var body: some View {
        VStack {
            switch appState {
            case .login:
                LoginView(appState: $appState)
            case .setup:
                SetupView(appState: $appState)
            case .time:
                TimeView(appState: $appState, studyDuration: $studyDuration)
            case .main, .afterQuit:
                CustomBar(studyDuration: studyDuration, appState: $appState)
            case .breakTime:
                BreakTimeView(appState: $appState)
            }
        }
        .background(Color("Color"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
