//
//  SettingsView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 10.10.2022.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDark") var isDark = false
    var body: some View {
        VStack{
            List{
            Section("dark/mode"){
                    Picker("",selection: $isDark){
                        Text("dark").tag(true)
                        Text("light").tag(false)
                    }.pickerStyle(.segmented)
                }
                Section("other"){
                    NavigationLink("About app",destination: AboutAppView())
                    NavigationLink("Alternate App Icon", destination: AlternateIconView())
                }
            }
        }.navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
