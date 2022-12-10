//
//  Bottle_GameApp.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 31.07.2022.
//

import SwiftUI
import RevenueCat



class AppDelegate: NSObject, UIApplicationDelegate {
    
    
}

@main
struct Bottle_GameApp: App {
    @Environment (\.colorScheme) var colorScheme
    @AppStorage("isDark") private var isDark = false
    @State private var showLaunchScreen: Bool = true
    
    
    var body: some Scene {
            WindowGroup {
                ZStack{
                    NavigationView{
                       ContentView()
                    }.navigationViewStyle(StackNavigationViewStyle())
                    .environment(\.colorScheme, isDark ? .dark : .light)
                    .environmentObject(IconNames())
                    ZStack{
                        if showLaunchScreen {
                            StartAppView(showLaunchScreen: $showLaunchScreen)
                                .transition(.opacity)
                        }
                    }.zIndex(2.0)
                }
        }
    }
}
