//
//  SettingsView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 13.08.2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
           
            Form{
                Section{
                NavigationLink("About this app", destination: AbotAppView())
                }
                Section{
                   
                }
            }.navigationTitle("Settings")
                //.navigationBarItems(leading: Button(action:{ appState.chahgeView = false }){Image(systemName: "arrow.left")})
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
