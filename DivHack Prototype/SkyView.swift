import SwiftUI

struct SkyView: View {
    var body: some View {
        ZStack {
            // Background Image covering the whole screen
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
            // Other content on top of the background image
            VStack(alignment: .center) {
                Text("The Sky is Your Limit!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Dark"))
                    .padding(.top, 70)
                
                Text("Fill your sky with endless possibilities.")
                    .font(.subheadline)
                    .foregroundColor(Color("Dark"))
                    .padding(.top, -10)
                /*
                Button(action: {
                    // No action needed
                }) {
                    Text("Store")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: 140)
                        .background(Color("Dark"))
                        .cornerRadius(40)
                }
                .padding(.top, 10)
                 */
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 80) // Adjust padding to accommodate the tab bar
        }
    }
}

struct SkyView_Previews: PreviewProvider {
    static var previews: some View {
        SkyView()
    }
}
