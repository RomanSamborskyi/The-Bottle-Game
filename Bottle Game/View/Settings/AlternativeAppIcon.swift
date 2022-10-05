//
//  AlternativeAppIcon.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 05.10.2022.
//

import SwiftUI

struct AlternativeAppIcon: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDark") private var isDark = false
    
    var body: some View {
        ZStack{
        LinearGradient(gradient: isDark ? Gradient(colors: [
            Color.black,
            Color.blue,
            Color.black,
        ]) : Gradient(colors: [
            Color.white,
            Color.blue,
            Color.white,
        ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing
        ).ignoresSafeArea(.all,edges: .all)
      
            VStack{
                Text("Choose your icon")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Image("Icon1")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .cornerRadius(10)
                Text("Icon 1")
                    .padding(30)
                Image("Icon2")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .cornerRadius(10)
                Text("Icon 2")
                    .padding(30)
                Spacer()
            }
        }.environment(\.colorScheme, isDark ? .dark : .light)
    }
}

struct AlternativeAppIcon_Previews: PreviewProvider {
    static var previews: some View {
        AlternativeAppIcon()
    }
}
