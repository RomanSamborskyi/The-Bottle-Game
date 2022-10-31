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
        ZStack{
            VStack{
                List{
                    Section("dark/mode"){
                        Picker("",selection: $isDark){
                            Text("dark").tag(true)
                            Text("light").tag(false)
                        }.pickerStyle(.segmented)
                    }.listRowBackground(isDark ? Color("ColorOfList"): .white)
                    Section("other"){
                        NavigationLink("About app",destination: AboutAppView())
                        NavigationLink("Alternate App Icon", destination: AlternateIconView())
                    }.listRowBackground(isDark ? Color("ColorOfList"): .white)
                }
              }
            VStack{
                Spacer()
                Text("made with \(Image(systemName: "heart.fill")) by @RomanSamborskyi").foregroundColor(Color.gray)
            }
        }.navigationTitle("Settings").navigationBarTitleDisplayMode(.automatic)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
