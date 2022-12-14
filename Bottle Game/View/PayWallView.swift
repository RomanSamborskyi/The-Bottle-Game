//
//  PayWallView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 10.12.2022.
//

import SwiftUI
import RevenueCat

struct PayWallView: View {
    @State
    private(set) var isPurchasing: Bool = false
    
    //paywallPresented
    //@Binding var isPresented: Bool
    private(set) var offerings: Offering? = UserViewModel.shared.offerings?.current
    @State private var error: NSError?
    @State private var displayError: Bool = false
    var body: some View {
        
            ForEach(offerings?.availablePackages ?? []){ package in
                mainView(package: package){(package) in
                    isPurchasing = true
                    Purchases.shared.purchase(package: package){(trasaction, info,error,UserCanceled) in
                        isPurchasing = false
                        
                        if info?.entitlements[secretApiKey.entitlementID]?.isActive == true {
                            //isPresented = false
                        }else if let error = error {
                            self.error = error as NSError
                            self.displayError = true
                        }
                    }
                }
           
        }
    }
struct mainView: View{
    let package:Package
    let onSelection:(Package) -> Void
        
    var body: some View {
            HStack{
                Text(package.storeProduct.localizedPriceString)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 3)
                        .foregroundColor(Color.init(red: 0.4, green: 11, blue: 4, opacity: 0.2))
                        .frame(width: 110, height: 55, alignment: .center))
                    .foregroundColor(Color.init(red: 0.4, green: 11, blue: 4, opacity: 0.2))
                    .font(.headline)
            }.contentShape(Rectangle())
                .onTapGesture {
                    onSelection(package)
                    HapticEngine.impact.imapct(style: .light)
                }
        }
    }
}

struct PayWallView_Previews: PreviewProvider {
    static var previews: some View {
        PayWallView()
    }
}
