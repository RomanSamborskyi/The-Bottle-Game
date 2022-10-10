//
//  AlternateIconView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 10.10.2022.
//

import SwiftUI

class IconNames: ObservableObject {
    var iconNames: [String?] = [nil]
    //exact index we're at inside our icon names
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName{
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
}
    
    func getAlternateIconNames(){
    //looking into our info.plist file to locate the specific Bundle with our icons
            if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
                let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any]
            {
                     
                 for (_, value) in alternateIcons{
                    //Accessing the name of icon list inside the dictionary
                     guard let iconList = value as? Dictionary<String,Any> else{return}
                     //Accessing the name of icon files
                     guard let iconFiles = iconList["CFBundleIconFiles"] as? [String]
                         else{return}
                         //Accessing the name of the icon
                     guard let icon = iconFiles.first else{return}
                     iconNames.append(icon)
        
                 }
            }
    }
}
struct AlternateIconView: View {
    @EnvironmentObject var iconSettings:IconNames
    var body: some View {
        Form{
            Picker(selection: $iconSettings.currentIndex,label:Text("Icons")){
                ForEach(0 ..< iconSettings.iconNames.count, id: \.self){i in
                    HStack(spacing:20){
                        Text(self.iconSettings.iconNames[i] ?? "AppIcon")
                        Image(uiImage: UIImage(named: self.iconSettings.iconNames[i] ?? "AppIcon") ?? UIImage())
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50, alignment: .leading)
                    }
                }.onReceive([self.iconSettings.currentIndex].publisher.first()){ value in
                    let i = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                    if value != i{
                        UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value], completionHandler: {
                            error in
                            if let error = error {
                                print(error.localizedDescription)
                            } else {
                                print("Success!")
                            }
                        })
                    }
                }
            }.pickerStyle(.inline)
            .navigationBarTitle("Change App Icon",displayMode: .inline)
        }
    }
}

struct AlternateIconView_Previews: PreviewProvider {
    static var previews: some View {
        AlternateIconView()
    }
}
