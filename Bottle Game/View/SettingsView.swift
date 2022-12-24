//
//  SettingsView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 10.10.2022.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDark") var isDark = false
    @AppStorage("Let it snow") private var letItSnow = false
    var body: some View {
        ZStack{
            VStack{
                List{
                    Section("Appearance"){
                        Toggle(isOn: $isDark) {
                            Text("Dark mode off/on")
                        }
                    }.listRowBackground(isDark ? Color("ColorOfList"): .white)
                    Section("Let it snow"){
                        Toggle(isOn: $letItSnow) {
                            Text("Turn off/on the winter mode")
                        }
                    }.listRowBackground(isDark ? Color("ColorOfList"): .white)
                    Section("other"){
                        NavigationLink("About app",destination: AboutAppView())
                        NavigationLink("Alternate App Icon", destination: AlternateIconView())
                        //NavigationLink("PayWall", destination: PayWallView())
                    }.listRowBackground(isDark ? Color("ColorOfList"): .white)
                }
              }
            VStack{
                Spacer()
                Image("BottleGray")
                    .resizable()
                    .frame(width: 80,height:60 )
                Text("The Bottle game  v.1.0.4").foregroundColor(Color.gray)
                    .padding(.vertical, 5)
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
