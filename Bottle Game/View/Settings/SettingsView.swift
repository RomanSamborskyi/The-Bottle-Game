//
//  SettingsView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 05.10.2022.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDark") private var isDark = false
    @Environment (\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
                Section("AboutApp"){
                    List{
                        NavigationLink("AboutView", destination: AboutAppView())
                        NavigationLink("Alternative Icon", destination: AlternativeAppIcon())
                    }
                }
            VStack{
                Spacer()
                Text("Made with \(Image(systemName: "heart.fill")) by @RomanSamborskyi")
                    .foregroundColor(Color.gray)
              }
            }.navigationBarItems(trailing: Button(action:{
                HapticEngine.impact.imapct(style: .medium)
                isDark.toggle()
            }){
                Text(Image(systemName: isDark ? "moon.fill":"sun.max.fill"))
                    .foregroundColor(isDark ? Color.purple : Color.yellow)
            }.buttonStyle(.bordered).tint(isDark ? .gray : .blue))
            .environment(\.colorScheme, isDark ? .dark : .light)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
