import SwiftUI

struct QuitButton: View {
    @Binding var appState: AppState

    var body: some View {
        Button(action: {
            // Navigate to AfterQuitView
            appState = .afterQuit
        }) {
            Image(systemName: "square.fill")
                .font(.title)
                .padding()
                .background(Color.white)
                .foregroundColor(Color("Dark"))
                .cornerRadius(60)
        }
    }
}

struct QuitButton_Previews: PreviewProvider {
    @State static var appState = AppState.main
    static var previews: some View {
        QuitButton(appState: $appState)
    }
}
