import SwiftUI

struct TimeView: View {
    @Binding var appState: AppState
    @Binding var studyDuration: Int
    let studyOptions = Array(0...5)

    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 170, height: 170)
                .padding(.top, 32)
                .padding(.bottom, 40)
            
            Text("How long are you studying for?")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
                .padding(.top, 40)
                .padding(.bottom, 20)
                .foregroundColor(Color("Fonts"))
            
            Picker("Select Study Duration", selection: $studyDuration) {
                ForEach(studyOptions, id: \.self) { hour in
                    Text("\(hour) hour\(hour > 1 ? "s" : "")")
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color.white)
            .cornerRadius(30)
            
            Spacer()
            
            Button(action: {
                appState = .main
            }) {
                Text("Let's Study!")
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
}

struct TimeView_Previews: PreviewProvider {
    @State static var appState = AppState.time
    @State static var studyDuration = 1

    static var previews: some View {
        TimeView(appState: $appState, studyDuration: $studyDuration)
    }
}
