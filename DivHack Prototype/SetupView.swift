import SwiftUI

struct SetupView: View {
    @Binding var appState: AppState
    @State private var username = ""
    @State private var selectedMood = "Swell!"

    let moods = ["Tired..", "So-So", "Swell!"]

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image("Logo")
                .resizable()
                .frame(width: 170, height: 170)
                .padding(.top, 32)
                .padding(.bottom, 20)

            Text("How are you feeling today?")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
                .padding(.top, 40)
                .padding(.bottom, 20)
                .foregroundColor(Color("Fonts"))
                

            Picker("Select Mood", selection: $selectedMood) {
                ForEach(moods, id: \.self) { mood in
                    Text(mood)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            

            Text(moodEmoji(selectedMood))
                .font(.system(size: 80)) // Adjust size as needed
                .padding(.top, 0)

            Spacer()

            Button(action: {
                appState = .time
            }) {
                Text("Continue")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Dark"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color("Color"))
    }

    func moodEmoji(_ mood: String) -> String {
        switch mood {
        case "Tired..":
            return "😴"
        case "So-So":
            return "😐"
        case "Swell!":
            return "😄"
        default:
            return "🙂"
        }
    }
}

struct SetupView_Previews: PreviewProvider {
    @State static var appState = AppState.setup
    static var previews: some View {
        SetupView(appState: $appState)
    }
}
