//
//  UserViewModel.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 10.12.2022.
//

import Foundation
import SwiftUI
import RevenueCat


class UserViewModel: ObservableObject {
    static let shared = UserViewModel()
    
    @Published var customerInfo: CustomerInfo? {
        didSet {
            subscriptionActive = (customerInfo?.entitlements[secretApiKey.entitlementID]?.isActive == true )
        }
    }
   @Published var offerings: Offerings? = nil
    
    @Published var subscriptionActive: Bool = false
}



