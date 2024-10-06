import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 30) { // Adjust spacing as needed
            TabBarButton(iconName: "clock.fill", tab: 1, selectedTab: $selectedTab)
            TabBarButton(iconName: "star.fill", tab: 2, selectedTab: $selectedTab)
            TabBarButton(iconName: "gearshape.fill", tab: 3, selectedTab: $selectedTab)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 5)
        .frame(maxWidth: 180) // Set the maximum width of the tab bar
    }
}

struct TabBarButton: View {
    let iconName: String
    let tab: Int
    @Binding var selectedTab: Int

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: iconName)
                .font(.system(size: 25))
                .foregroundColor(selectedTab == tab ? Color("Dark") : Color("Color"))
        }
    }
}
