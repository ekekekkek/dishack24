import SwiftUI

struct LoginView: View {
    @Binding var appState: AppState
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            Spacer()
            
            Image("Logo")
                .resizable()
                .frame(width: 170, height: 170)
                .padding(.top, 30)
                .padding(.bottom, 20)
            
            Text("HAPPY HOUR")
                .fontWeight(.heavy)
                .foregroundColor(Color("Fonts"))
                .font(.system(size: 30))
            
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 250)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            
            Button(action: {
                // Perform your authentication logic here
                // On successful login:
                appState = .setup
            }) {
                Text("Log In")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Dark"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .background(Color("Color"))
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var appState = AppState.login
    static var previews: some View {
        LoginView(appState: $appState)
    }
}
