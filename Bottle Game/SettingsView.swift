//
//  SettingsView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 13.08.2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            Form{
                Text("About this app")
                    .font(.headline)
            }
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
