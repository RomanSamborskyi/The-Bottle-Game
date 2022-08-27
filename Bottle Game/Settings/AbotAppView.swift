//
//  AbotAppView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 13.08.2022.
//

import SwiftUI

struct AbotAppView: View {
    var body: some View {
        VStack{
            Form{
                Section{
       Image("me")
            .resizable()
            .frame(width: 270, height: 245)
            .clipShape(Circle())
            .shadow(color: Color.black, radius: 10)
            .padding()
            .animation(Animation.easeInOut(duration: 1))
                
            Text("Hello, my name is Roman Samborskyi.I am passionate about programming and just learning it.This application is my first app.This is a simple game, bottle.So enjoy it")
                .font(.callout)
                .padding()
                .animation(Animation.easeIn(duration: 2))
                }
            }
        }
    }
}

struct AbotAppView_Previews: PreviewProvider {
    static var previews: some View {
        AbotAppView()
    }
}
