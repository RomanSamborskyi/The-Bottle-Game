//
//  PurchasesDelegateHandler.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 10.12.2022.
//

import Foundation
import RevenueCat
import SwiftUI


class PurchasesDelegateHandler: NSObject, ObservableObject {
    
    static let shered = PurchasesDelegateHandler()
}


extension PurchasesDelegateHandler: PurchasesDelegate {
    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {
        UserViewModel.shared.customerInfo = customerInfo
    }
}
