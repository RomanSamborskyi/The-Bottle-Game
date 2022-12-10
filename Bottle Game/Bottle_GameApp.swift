//
//  Bottle_GameApp.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 31.07.2022.
//

import SwiftUI
import RevenueCat
import StoreKit


@main
struct Bottle_GameApp: App {
    @Environment (\.colorScheme) var colorScheme
    @AppStorage("isDark") private var isDark = false
    @State private var showLaunchScreen: Bool = true
    init(){
        Purchases.logLevel = .debug
        Purchases.configure(with: Configuration.builder(withAPIKey: secretApiKey.revenuecat_api_key ).with(usesStoreKit2IfAvailable: true).build())
        Purchases.shared.delegate = PurchasesDelegateHandler.shered
    }
    
    var body: some Scene {
            WindowGroup {
                ZStack{
                    NavigationView{
                       ContentView()
                            .task {
                                do{
                                    UserViewModel.shared.offerings = try await Purchases.shared.offerings()
                                }catch{
                                    print("Error of fatching offering \(error)")
                                }
                            }
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
