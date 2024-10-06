//
//  SettingView.swift
//  DivHack Prototype
//
//  Created by Kim Eugene on 10/5/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack {
            Color("Color") // Background color for Settings
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Dark"))
                    .padding()
                
                Text("Manage your preferences here.")
                    .font(.title2)
                    .foregroundColor(Color("Dark"))
                    .padding(.top, 10)
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
