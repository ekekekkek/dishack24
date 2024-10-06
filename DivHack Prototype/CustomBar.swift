import SwiftUI

struct CustomBar: View {
    @State private var selectedTab: Int = 1
    var studyDuration: Int
    @Binding var appState: AppState

    var body: some View {
        ZStack {
            Group {
                // Handle BreakTimeView outside of CustomBar
                switch selectedTab {
                case 1:
                    switch appState {
                    case .main:
                        MainView(studyDuration: studyDuration, appState: $appState)
                    case .afterQuit:
                        AfterQuitView(appState: $appState, studyDuration: .constant(studyDuration))
                    default:
                        MainView(studyDuration: studyDuration, appState: $appState)
                    }
                case 2:
                    SkyView()
                case 3:
                    SettingView()
                default:
                    MainView(studyDuration: studyDuration, appState: $appState)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Show tab bar unless in BreakTime
            VStack {
                Spacer()
                if appState != .breakTime {
                    HStack {
                        Spacer()
                        CustomTabBar(selectedTab: $selectedTab)
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomBar_Previews: PreviewProvider {
    @State static var appState = AppState.main
    static var previews: some View {
        CustomBar(studyDuration: 1, appState: $appState)
    }
}
