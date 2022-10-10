//
//  Bottle_GameApp.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 31.07.2022.
//

import SwiftUI

@main
struct Bottle_GameApp: App {
    @Environment (\.colorScheme) var colorScheme
    @AppStorage("isDark") private var isDark = false
    
    var body: some Scene {
            WindowGroup {
                NavigationView{
                    StartAppView()
                }.navigationViewStyle(StackNavigationViewStyle())
                .environment(\.colorScheme, isDark ? .dark : .light)
                .environmentObject(IconNames())
        }
    }
}
